import 'package:grpc/grpc.dart';

class SingleChannelClient extends ClientChannel {
  static SingleChannelClient? _channelClientSub;

  SingleChannelClient(String host, int port,
      {ChannelOptions optionsServiceChannelHandler = const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      )})
      : super(host, port: port, options: optionsServiceChannelHandler);

  factory SingleChannelClient.factory(String host, int port) {
    _channelClientSub ??= SingleChannelClient(host, port);
    return _channelClientSub!;
  }
}
