import 'dart:js_util';

import 'package:usb_device_platform_interface/models/configurations/usb_interface.dart';

class USBConfiguration {
  final String? configurationName;
  final int? configurationValue;
  final List<USBInterface>? usbInterfaces;

  USBConfiguration(
      {required this.configurationName,
      required this.configurationValue,
      required this.usbInterfaces});

  static USBConfiguration fromConfiguration(dynamic configuration) {
    return USBConfiguration(
      configurationName: getProperty(configuration, "configurationName"),
      configurationValue: getProperty(configuration, "configurationValue"),
      usbInterfaces: getProperty(configuration, "interfaces") == null
          ? null
          : USBInterface.fromInterfaces(
              getProperty(configuration, "interfaces")),
    );
  }

  @override
  String toString() =>
      'USBConfiguration(configurationName: $configurationName, configurationValue: $configurationValue, usbInterfaces: $usbInterfaces)';
}
