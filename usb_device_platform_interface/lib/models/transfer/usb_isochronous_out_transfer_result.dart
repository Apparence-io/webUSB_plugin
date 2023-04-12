import 'dart:js_util';

class USBIsochronousOutTransferResult {
  final dynamic packets;

  USBIsochronousOutTransferResult({
    required this.packets,
  });

  static USBIsochronousOutTransferResult fromDataJS(dynamic dataJS) {
    return USBIsochronousOutTransferResult(
        packets: getProperty(dataJS, 'packets'));
  }
}
