import 'dart:js_util';

class USBDeviceInfo {
  final int usbVersionMajor;
  final int usbVersionMinor;
  final int usbVersionSubMinor;
  final int deviceClass;
  final int deviceSubClass;
  final int deviceProtocol;
  final int vendorId;
  final int productId;
  final int deviceVersionMajor;
  final int deviceVersionMinor;
  final int deviceVersionSubMinor;
  final String manufacturerName;
  final String productName;
  final String serialNumber;
  final bool opened;

  USBDeviceInfo(
      this.usbVersionMajor,
      this.usbVersionMinor,
      this.usbVersionSubMinor,
      this.deviceClass,
      this.deviceSubClass,
      this.deviceProtocol,
      this.vendorId,
      this.productId,
      this.deviceVersionMajor,
      this.deviceVersionMinor,
      this.deviceVersionSubMinor,
      this.manufacturerName,
      this.productName,
      this.serialNumber,
      this.opened);

  static USBDeviceInfo fromDeviceJS(dynamic pairedDevice) {
    return USBDeviceInfo(
      getProperty(pairedDevice, 'usbVersionMajor'),
      getProperty(pairedDevice, 'usbVersionMinor'),
      getProperty(pairedDevice, 'usbVersionSubminor'),
      getProperty(pairedDevice, 'deviceClass'),
      getProperty(pairedDevice, 'deviceSubclass'),
      getProperty(pairedDevice, 'deviceProtocol'),
      getProperty(pairedDevice, 'vendorId'),
      getProperty(pairedDevice, 'productId'),
      getProperty(pairedDevice, 'deviceVersionMajor'),
      getProperty(pairedDevice, 'deviceVersionMinor'),
      getProperty(pairedDevice, 'deviceVersionSubminor'),
      getProperty(pairedDevice, 'manufacturerName'),
      getProperty(pairedDevice, 'productName'),
      getProperty(pairedDevice, 'serialNumber'),
      getProperty(pairedDevice, 'opened'),
    );
  }
}
