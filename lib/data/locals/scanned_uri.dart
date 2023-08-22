class ScannedData {
  final String? scannedTopic;
  final String? scannedRelayProtocol;
  final String? scannedUriString;

  ScannedData({this.scannedRelayProtocol, this.scannedTopic, this.scannedUriString});

  factory ScannedData.fromUri(String scannedUriString) {
    Uri uri = Uri.parse(scannedUriString);
    final relayProtocol = uri.queryParameters['relay-protocol'];
    final path = uri.path;
    final String topic = (path.contains("@")? path.split("@").first:path );
    return ScannedData(
      scannedUriString: scannedUriString,
      scannedRelayProtocol: relayProtocol,
      scannedTopic: topic,
    );
  }
}
