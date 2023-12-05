import 'package:grpc/grpc_connection_interface.dart';
import 'package:modern_vpn_project/generated/host_service.pbgrpc.dart';
import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';

class HostService extends HostServiceClient {
  final AuthRepositoryImpl _authRepositoryImpl;

  HostService(super.channel, this._authRepositoryImpl);

  Future<List<HostData>> takeHostFromServer() async {
    final token = _authRepositoryImpl.tokenGetter;
    final rawHost = await listHosts(ListHostsRequest(),
        options: CallOptions(metadata: {'AuthToken': '$token'}));

    return rawHost.hosts.map((e) => HostData.fromProto(e)).toList();
  }

}
