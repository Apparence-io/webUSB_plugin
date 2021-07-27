import 'dart:js_util';
import 'dart:typed_data';

class USBIsochronousInTransferResult {
  final Uint8List data;
  final dynamic packets;

  USBIsochronousInTransferResult({
    required this.data,
    required this.packets,
  });

  static USBIsochronousInTransferResult fromDataJS(dynamic dataJS) {
    var data = getProperty(dataJS, 'data');
    return USBIsochronousInTransferResult(
        data: Uint8List.view(getProperty(data, 'buffer')),
        packets: getProperty(dataJS, 'packets'));
  }
}
