import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';
import 'package:modern_vpn_project/src/features/vpn/services/host_service.dart';
import 'package:rxdart/rxdart.dart';

class HostRepository {
  final BehaviorSubject<List<HostData>> _hostsSubject = BehaviorSubject();
  final HostService hostService;
  final AuthRepositoryImpl _authRepository;

  HostRepository(this.hostService, this._authRepository);

  List<HostData>? get loadedHost => _hosts;

  List<HostData>? _hosts;

  final _tempHosts = [
    const HostData(
        ip: "143.110.145.51",
        country: "San Francisco, USA",
        imagePath: "assets/images/flags/US.png",
        id: "01H5FQPVOYDKHJRT68N34P609G"),
    const HostData(
        ip: "147.182.141.164",
        country: "New York, USA",
        imagePath: "assets/images/flags/US.png",
        id: "01H5FSHNOV1FF5AB3SYQX3XZAX"),
    const HostData(
        ip: "142.93.239.64",
        country: "Amsterdam, Netherlands",
        imagePath: "assets/images/flags/NL.png",
        id: "01H5FXQJBKSM4Z6HW9612JNSNE"),
    const HostData(
        ip: "157.230.243.176",
        country: "Singapore",
        imagePath: "assets/images/flags/SG.png",
        id: "01H5FXQY32Z6BEKABKOCHM592C"),
    const HostData(
        ip: "165.232.37.196",
        country: "London, UK",
        imagePath: "assets/images/flags/GB.png",
        id: "01H5FXRCV22XDWWB48E1DK2QES"),
    const HostData(
        ip: "207.154.205.106",
        country: "Frankfurt, Germany",
        imagePath: "assets/images/flags/DE.png",
        id: "01H5FXRV37RZKTS7W36C256T"),
    const HostData(
        ip: "138.197.138.214",
        country: "Toronto, Canada",
        imagePath: "assets/images/flags/CA.png",
        id: "01H5FXS5BJCBMAZH98AY5TJ5DY"),
    const HostData(
        ip: "143.110.182.114",
        country: "Bangalore, India",
        imagePath: "assets/images/flags/IN.png",
        id: "01H5FXSK6KKCGA2K913PMOEEV"),
    const HostData(
        ip: "170.64.129.167",
        country: "Sydney, Australia",
        imagePath: "assets/images/flags/AU.png",
        id: "01H5FXTW2PFOECT2MFRRGJZXXJ")
  ];

  Stream<List<HostData>> get hostsElementGetterStream => _hostsSubject.stream;

  Future<HostData?> getActiveConfiguration() async {
    return _hosts!.first;
  }

  Future<List<HostData>> hostsGetterFunction() async {
    return _tempHosts;
    // if ((_hosts?.isEmpty ?? true)) {
    //   try {
    //     final hosts = await hostService.takeHostFromServer();
    //
    //     _hosts = hosts;
    //
    //     _hostsSubject.add(_hosts ?? []);
    //     return _hosts ?? [];
    //   } catch (err, st) {
    //     Sentry.captureException(err, stackTrace: st);
    //     _hosts = _tempHosts.map((e) => HostData(host: e)).toList();
    //     return _hosts ?? [];
    //   }
    // } else {
    //   _hosts = _tempHosts.map((e) => HostData(host: e)).toList();
    //   return _hosts ?? [];
    // }
  }

  Future<void> disposer() async {
    await _hostsSubject.close();
  }
}
