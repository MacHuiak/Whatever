enum ConnectionTypeElement {
  disconnected("Not Connected"),
  connected("Connected"),
  connecting("Connecting..."),
  disconnecting("Disconnecting...");

  final String connectionStageValue;

  const ConnectionTypeElement(this.connectionStageValue);

  factory ConnectionTypeElement.getTypeByName(String name) {
    switch (name) {
      case "disconnected":
        return ConnectionTypeElement.disconnected;
      case "connected":
        return ConnectionTypeElement.connected;
      case "disconnecting":
        return ConnectionTypeElement.disconnecting;
      case "connecting":
        return ConnectionTypeElement.connecting;
      default:
        return ConnectionTypeElement.disconnected;
    }
  }
}
