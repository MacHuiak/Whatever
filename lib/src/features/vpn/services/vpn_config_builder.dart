sealed class ConfigBuilder {
  String getOpenVPNConfig(
      {required String ca,
      required String crt,
      required String privateKey,
      required String ip});
}

class OpenVPNConfigBuilder implements ConfigBuilder {
  @override
  String getOpenVPNConfig(
      {required String ca,
      required String crt,
      required String privateKey,
      required String ip}) {
    return """
client
dev tun
proto udp
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
cipher AES-256-CBC
redirect-gateway
verb 3
remote $ip 1194
<ca>
$ca
</ca>
<cert>
$crt
</cert>
<key>
$privateKey
</key>
  """;
  }
}
