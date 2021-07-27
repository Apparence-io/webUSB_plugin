import 'dart:js_util';

import 'package:usb_device_platform_interface/models/configurations/usb_endpoint.dart';

class USBAlternateInterface {
  final int alternateSetting;
  final List<USBEndpoint>? endpoints;

  USBAlternateInterface(
      {required this.alternateSetting, required this.endpoints});

  static List<USBAlternateInterface> fromAlternateInterfaces(
      List<dynamic> alternateInterfaces) {
    return alternateInterfaces
        .map((e) => USBAlternateInterface(
              alternateSetting: getProperty(e, "alternateSetting"),
              endpoints: getProperty(e, "endpoints") == null
                  ? null
                  : USBEndpoint.fromEndpoints(getProperty(e, "endpoints")),
            ))
        .toList();
  }

  @override
  String toString() =>
      'USBAlternateInterface(alternateSetting: $alternateSetting, endpoints: $endpoints)';
}
