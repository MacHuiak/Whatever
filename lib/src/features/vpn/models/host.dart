import 'package:flutter/foundation.dart';
import 'package:modern_vpn_project/generated/host.pb.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

@immutable
class HostData {
  final String ip;
  final String country;
  final String imagePath;
  final String id;

  const HostData(
      {required this.ip,
      required this.country,
      required this.imagePath,
      required this.id});

  factory HostData.fromProto(Host protoHost) => HostData(
        ip: protoHost.id,
        country: protoHost.hostsIpGetter(),
        imagePath: protoHost.getNameCountryFunction(),
        id: protoHost.getImagePath(),
      );
}

extension ExtensioHostInfoElement on Host {
  String hostsIpGetter() {
    List<String> b = toString()
        .split("\n")[1]
        .split(":")[1]
        .replaceAll("[", "")
        .replaceAll("]", "")
        .split(",")
        .map((e) => e.trim())
        .toList();
    final ip = b.getRange(b.length - 4, b.length).join(".");
    return ip;
  }

  String getNameCountryFunction() {
    switch (country) {
      case HostCountry.COUNTRY_AUS:
        return S.current.australia;
      case HostCountry.COUNTRY_IND:
        return S.current.India;
      case HostCountry.COUNTRY_DEU:
        return S.current.Germany;
      case HostCountry.COUNTRY_GBR:
        return S.current.Uk;
      case HostCountry.COUNTRY_SGP:
        return S.current.Singapore;
      case HostCountry.COUNTRY_USA:
        return S.current.Usa;
      case HostCountry.COUNTRY_NLD:
        return S.current.Netherlands;
      case HostCountry.COUNTRY_CAN:
        return S.current.Canada;
      case HostCountry.COUNTRY_UNSPECIFIED:
        return S.current.unknown;
      default:
        return S.current.unknown;
    }
  }

  String getImagePath() {
    pathFunction(String country) => (StringBuffer("assets/images/flags/")
          ..write(country)
          ..write(".png"))
        .toString();
    switch (country) {
      case HostCountry.COUNTRY_AUS:
        return pathFunction("AU");
      case HostCountry.COUNTRY_IND:
        return pathFunction("IN");
      case HostCountry.COUNTRY_DEU:
        return pathFunction("DE");
      case HostCountry.COUNTRY_GBR:
        return pathFunction("GB");
      case HostCountry.COUNTRY_SGP:
        return pathFunction("SG");
      case HostCountry.COUNTRY_USA:
        return pathFunction("US");
      case HostCountry.COUNTRY_NLD:
        return pathFunction("NL");
      case HostCountry.COUNTRY_CAN:
        return pathFunction("CA");
      case HostCountry.COUNTRY_UNSPECIFIED:
        return "Unknown";
      default:
        return "Unknown";
    }
  }
}
