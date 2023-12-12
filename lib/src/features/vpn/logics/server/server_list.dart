import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_vpn_project/generated/host.pb.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';

final hostInfoProvider =
    NotifierProvider<HostInfo, HostInfoModel>(HostInfo.new);

final loadedHostsProvider = Provider<List<HostData>>((ref) {
  return ref.watch(hostInfoProvider).loadedHost;
});

final selectedHostProvider = Provider<HostData?>((ref) {
  return ref.watch(hostInfoProvider).selectedHost;
});

@immutable
class HostInfoModel {
  final List<HostData> loadedHost;
  final HostData? selectedHost;

  const HostInfoModel({this.loadedHost = const [], this.selectedHost});

  HostInfoModel copyWith({HostData? host}) {
    return HostInfoModel(
        loadedHost: loadedHost, selectedHost: host ?? selectedHost);
  }
}

class HostInfo extends Notifier<HostInfoModel> {
  @override
  HostInfoModel build() => const HostInfoModel(
          loadedHost: [
            HostData(
                ip: "143.110.145.51",
                country: "San Francisco, USA",
                imagePath: "assets/images/flags/US.png",
                id: "01H5FQPVOYDKHJRT68N34P609G"),
            HostData(
                ip: "147.182.141.164",
                country: "New York, USA",
                imagePath: "assets/images/flags/US.png",
                id: "01H5FSHNOV1FF5AB3SYQX3XZAX"),
            HostData(
                ip: "142.93.239.64",
                country: "Amsterdam, Netherlands",
                imagePath: "assets/images/flags/NL.png",
                id: "01H5FXQJBKSM4Z6HW9612JNSNE"),
            HostData(
                ip: "157.230.243.176",
                country: "Singapore",
                imagePath: "assets/images/flags/SG.png",
                id: "01H5FXQY32Z6BEKABKOCHM592C"),
            HostData(
                ip: "165.232.37.196",
                country: "London, UK",
                imagePath: "assets/images/flags/GB.png",
                id: "01H5FXRCV22XDWWB48E1DK2QES"),
            HostData(
                ip: "207.154.205.106",
                country: "Frankfurt, Germany",
                imagePath: "assets/images/flags/DE.png",
                id: "01H5FXRV37RZKTS7W36C256T"),
            HostData(
                ip: "138.197.138.214",
                country: "Toronto, Canada",
                imagePath: "assets/images/flags/CA.png",
                id: "01H5FXS5BJCBMAZH98AY5TJ5DY"),
            HostData(
                ip: "143.110.182.114",
                country: "Bangalore, India",
                imagePath: "assets/images/flags/IN.png",
                id: "01H5FXSK6KKCGA2K913PMOEEV"),
            HostData(
                ip: "170.64.129.167",
                country: "Sydney, Australia",
                imagePath: "assets/images/flags/AU.png",
                id: "01H5FXTW2PFOECT2MFRRGJZXXJ")
          ],
          selectedHost: HostData(
              ip: "143.110.145.51",
              country: "San Francisco, USA",
              imagePath: "assets/images/flags/US.png",
              id: "01H5FQPVOYDKHJRT68N34P609G"));

  void selectHost(HostData host) {
    state = state.copyWith(host: host);
  }
}
