import 'dart:js_util';

class USBEndpoint {
  final String direction;
  final int endpointNumber;
  final int packetSize;
  final String type;

  USBEndpoint(
      {required this.direction,
      required this.endpointNumber,
      required this.packetSize,
      required this.type});

  static List<USBEndpoint> fromEndpoints(List<dynamic> endpoints) {
    return endpoints
        .map((endpoint) => USBEndpoint(
            direction: getProperty(endpoint, "direction"),
            endpointNumber: getProperty(endpoint, "endpointNumber"),
            packetSize: getProperty(endpoint, "packetSize"),
            type: getProperty(endpoint, "type")))
        .toList();
  }

  @override
  String toString() =>
      'USBEndpoint(direction: $direction, endpointNumber: $endpointNumber, packetSize: $packetSize, type: $type )';
}
