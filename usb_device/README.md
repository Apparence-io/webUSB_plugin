<p align="center">
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
<a href="https://pub.dev/packages/bart"><img src="https://img.shields.io/pub/v/usb_device" alt="pub dev webusb"></a>
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

- [x] getDevices() : Get paired attached devices
- [x] requestDevice(filters): pair a device with filter or not

### USBDevice

- [x] Get device info with configuration
- [x] open(): *Start session*
- [x] close(): *Close session*
- [x] selectConfiguration(configurationValue): *Select a specified configuration*
- [x] claimInterface(interfaceNumber): *Claim an interface for exclusive access*
- [x] releaseInterface(interfaceNumber): *Release a claimed interface*
- [x] controlTransferIn(setup, length): *Return result of a command*
- [x] controlTransferOut(setup, data) : *Send a command to device*
- [x] transferIn(): *Return data from device*
- [x] transferOut(): *Send data to device*
- [x] clearHalt()
- [x] reset(): *Reset device*
- [x] isochronousTransferIn()
- [x] isochronousTransferOut()

### Events
- [x] OnConnect
- [x] OnDisconnect
