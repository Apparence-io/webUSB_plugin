import 'dart:js_util';

import 'package:usb_device_platform_interface/models/configurations/usb_alternate_interface.dart';

class USBInterface {
  final int interfaceNumber;
  final bool claimed;
  final List<USBAlternateInterface>? alternatesInterface;

  USBInterface(
      {required this.interfaceNumber,
      required this.claimed,
      required this.alternatesInterface});

  static List<USBInterface> fromInterfaces(List<dynamic> interfaces) {
    return interfaces
        .map((interface) => USBInterface(
            interfaceNumber: getProperty(interface, "interfaceNumber"),
            claimed: getProperty(interface, "claimed"),
            alternatesInterface: getProperty(interface, "alternates") == null
                ? null
                : USBAlternateInterface.fromAlternateInterfaces(
                    getProperty(interface, "alternates"))))
        .toList();
  }

  @override
  String toString() =>
      'USBInterface(interfaceNumber: $interfaceNumber, claimed: $claimed, alternatesInterface: $alternatesInterface )';
}
