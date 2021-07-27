import 'dart:js_util';

import 'dart:typed_data';

import 'package:usb_device_platform_interface/models/transfer/response/status_response.dart';

class USBInTransferResult {
  final Uint8List data;
  final StatusResponse status;

  USBInTransferResult({
    required this.data,
    required this.status,
  });

  static USBInTransferResult fromDataJS(dynamic dataJS) {
    var data = getProperty(dataJS, 'data');
    StatusResponse status =
        StatusResponseHelper.fromString(getProperty(dataJS, 'status'));
    return USBInTransferResult(
        data: Uint8List.view(getProperty(data, 'buffer')), status: status);
  }
}
