import 'dart:js_util';

import 'package:usb_device_platform_interface/models/transfer/response/status_response.dart';

class USBOutTransferResult {
  final int bytesWritten;
  final StatusResponse status;

  USBOutTransferResult({
    required this.bytesWritten,
    required this.status,
  });

  static USBOutTransferResult fromDataJS(dynamic res) {
    StatusResponse status =
        StatusResponseHelper.fromString(getProperty(res, 'status'));
    return USBOutTransferResult(
        bytesWritten: getProperty(res, 'bytesWritten'), status: status);
  }
}
