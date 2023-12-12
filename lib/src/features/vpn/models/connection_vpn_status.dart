enum ConnectionStatus {
  disconnected("Not Connected"),
  connected("Connected"),
  connecting("Connecting..."),
  disconnecting("Disconnecting...");

  final String connectionStageValue;

  const ConnectionStatus(this.connectionStageValue);

  factory ConnectionStatus.getTypeByName(String name) {
    switch (name) {
      case "disconnected":
        return ConnectionStatus.disconnected;
      case "connected":
        return ConnectionStatus.connected;
      case "disconnecting":
        return ConnectionStatus.disconnecting;
      case "connecting":
        return ConnectionStatus.connecting;
      default:
        return ConnectionStatus.disconnected;
    }
  }
}
