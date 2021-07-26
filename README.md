<p align="center">
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
<a href="https://pub.dev/packages/bart"><img src="https://img.shields.io/pub/v/bart" alt="pub dev webusb"></a>
</p>

# **WebUSB plugin** 
<a href="https://en.apparence.io"><img src="https://github.com/Apparence-io/bart/raw/master/.github/img/logo.png" alt="Apparence.io logo"></a>
<p><small>Developed with 💙 &nbsp;by Apparence.io</small></p>

This plugin provide access to USB devices from web pages with WebUSB.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :----: |
|   ➖    | ➖   |  ➖  | ✔️  |  ➖   |   ➖   |


## Usage

You can get wi-fi related information using:

```dart
import 'package:usb_device/usb_device.dart';

final UsbDevice usbDevice = UsbDevice();

var pairedDevices = await usbDevice.pairedDevices;
var pairedDevice = await usbDevice.requestDevices([DeviceFilter(vendorId : 0x00, productId: 0x00)]);
List<USBConfiguration> availableConfigurations = await usbDevice.getAvailableConfigurations(pairedDevice);
USBDeviceInfo deviceInfo = await usbDevice.getPairedDeviceInfo(pairedDevice);
await usbDevice.open(pairedDevice);
await usbDevice.close(pairedDevice);
```

## Implementation

### USB

- [x] getDevices()
- [x] requestDevice()

### USBDevice

- [x] Get device info with configuration
- [x] open()
- [x] close()
- [x] selectConfiguration()
- [x] claimInterface()
- [x] releaseInterface()
- [x] controlTransferIn()
- [x] controlTransferOut()
- [x] transferIn()
- [x] transferOut()
- [x] clearHalt()
- [x] reset()
- [x] isochronousTransferIn()
- [x] isochronousTransferOut()

### Events
- [x] connect
- [x] disconnect
