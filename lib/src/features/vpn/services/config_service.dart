import 'dart:convert';
import 'package:basic_utils/basic_utils.dart'
    show CryptoUtils, RSAPrivateKey, RSAPublicKey, X509Utils;
import 'package:flutter/foundation.dart';
import 'package:grpc/service_api.dart';
import 'package:modern_vpn_project/generated/openvpn_service.pbgrpc.dart';
import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/vpn/repositories/auth_repository.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_config_builder.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ConfigServiceImpl extends OpenvpnServiceClient {
  final AuthRepositoryImpl _authRepository;
  final ConfigBuilder openVPNConfigBuilder = OpenVPNConfigBuilder();

  ConfigServiceImpl(super.channel, this._authRepository);

  Future<String> getCertChain(String accessToken) async {
    GetCACertChainResponse chainCertResponse = await getCACertChain(
        GetCACertChainRequest(),
        options: CallOptions(metadata: {'AuthToken': accessToken}));
    final ca = utf8.decode(chainCertResponse.chain);
    return ca;
  }

  Future<String> getConfig(String ip) async {
    final accessToken = _authRepository.tokenGetter;
    if (accessToken == null) {
      Sentry.captureMessage("DON NOT GET ACCESS TOKEN");

      throw Exception();
    }
    final crtAndPrivateKey = await getCrtAndPrivateKey(accessToken);
    final ca = await getCertChain(accessToken);

    final config = openVPNConfigBuilder.getOpenVPNConfig(
        ca: ca,
        crt: crtAndPrivateKey.$1,
        privateKey: crtAndPrivateKey.$2,
        ip: ip);
    Sentry.captureMessage("GENERATED CONFIG $config");
    return config;
  }

  Future<(String, String)> getCrtAndPrivateKey(String accessToken) async {
    final csrAndPrivate = await compute<String, (String, String)>(
        GenerateKeyService.generateThingsForVPNConnection, "");
    final signCertRequest = SignClientCertRequest();
    signCertRequest.csr = utf8.encode(csrAndPrivate.$1);
    final crtResponse = await signClientCert(signCertRequest,
        options: CallOptions(metadata: {'AuthToken': accessToken}));
    final crt = utf8.decode(crtResponse.cert);
    return (crt, csrAndPrivate.$2);
  }
}

class GenerateKeyService {
  static Future<(String, String)> generateThingsForVPNConnection(
      String test) async {
    final pair = CryptoUtils.generateRSAKeyPair();
    final publicKey = pair.privateKey as RSAPrivateKey;
    final csr = X509Utils.generateRsaCsrPem({"C": "GE"},
        pair.privateKey as RSAPrivateKey, pair.publicKey as RSAPublicKey);
    final pemKey = CryptoUtils.encodeRSAPrivateKeyToPem(publicKey);
    return (csr, pemKey);
  }
}
