import 'dart:js_util';
import 'dart:typed_data';

class USBIsochronousOutTransferResult {
  final dynamic packets;

  USBIsochronousOutTransferResult({
    required this.packets,
  });


  static USBIsochronousOutTransferResult fromDataJS(dynamic dataJS){
    return USBIsochronousOutTransferResult(packets: getProperty(dataJS, 'packets'));
  }
}