<p align="center">
  <img src="https://github.com/Apparence-io/webUSB_plugin/raw/master/assets/img/logo.jpg" alt="web usb logo" />
</p>
<br><br>

<p align="center">
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
  <a href="https://pub.dev/packages/usb_device"><img src="https://img.shields.io/pub/v/usb_device" alt="pub dev usb_device"></a>
</p>
<br>
<hr>
<br>

## 🚀&nbsp; Overview

**WebUSB** plugin provide access to USB devices from Flutter Web 💙 by using [**web usb official API**](https://wicg.github.io/webusb/).

- 📱 Get device info with configuration.
- 🔌 Pair a device with filter.
- 📤 Send data to USB device.
- 📥 Receive data from USB device.
- 🎛️ Change USB device configuration.

## 💻&nbsp; Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ➖    | ➖  |  ➖   | ✔️  |  ➖   |   ➖    |

## 📖&nbsp; Installation

### Install the package

```sh
flutter pub add usb_device
```

### Import the package

```dart
import 'package:usb_device/usb_device.dart';
```

## 🚀&nbsp; Get started

- Import & instanciate the plugin.

```dart
import 'package:usb_device/usb_device.dart';

final UsbDevice usbDevice = UsbDevice();
```

- Common used methods.

```dart

// get paired devices
final pairedDevices = await usbDevice.pairedDevices;

// pair a device
final pairedDevice = await usbDevice.requestDevices([DeviceFilter(vendorId : 0x00, productId: 0x00)]);

// get device's configurations
List<USBConfiguration> availableConfigurations = await usbDevice.getAvailableConfigurations(pairedDevice);

// get device's info
USBDeviceInfo deviceInfo = await usbDevice.getPairedDeviceInfo(pairedDevice);

// start session
await usbDevice.open(pairedDevice);

// close session
await usbDevice.close(pairedDevice);
```

## 📚&nbsp; Methods

## USB

| Name                                                                                  | Description                                                                                                                         | Returned value                            |
| ------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------- |
| `pairedDevices`                                                                       | Get paired attached devices                                                                                                         | `Future<List<dynamic>>`                   |
| `requestDevice(List<DeviceFilter> filters)`                                           | Pair a device with filter or not                                                                                                    | `Future<dynamic>`                         |
| `isSupported()`                                                                       | Pair a device with filter or not                                                                                                    | `Future<bool>`                            |
| `open()`                                                                              | Start a session                                                                                                                     | `Future`                                  |
| `close()`                                                                             | Close a session                                                                                                                     | `Future`                                  |
| `claimInterface(dynamic device, int interfaceNumber)`                                 | Claim an interface for exclusive access                                                                                             | `Future`                                  |
| `releaseInterface(dynamic device, int interfaceNumber)`                               | Release a claimed interface                                                                                                         | `Future`                                  |
| `reset(dynamic device)`                                                               | Reset device                                                                                                                        | `Future`                                  |
| `selectConfiguration(dynamic device, int configurationValue)`                         | Select a specified configuration                                                                                                    | `Future`                                  |
| `clearHalt(dynamic device, String direction, int endpointNumber)`                     | Returns a promise that resolves when a halt condition is cleared                                                                    | `Future`                                  |
| `controlTransferIn(dynamic device, SetupParam setup, {int? length})`                  | Return result of a command                                                                                                          | `Future<USBInTransferResult>`             |
| `controlTransferOut(dynamic device, SetupParam setup, {dynamic data})`                | Send a command to device                                                                                                            | `Future<USBOutTransferResult>`            |
| `transferIn(dynamic device, int endpointNumber, int length)`                          | Return data from device                                                                                                             | `Future<USBInTransferResult>`             |
| `transferOut(dynamic device, int endpointNumber, dynamic data)`                       | Send data to device                                                                                                                 | `Future<USBOutTransferResult>`            |
| `isochronousTransferIn(dynamic device, int endpointNumber, List<int> packetLengths)`  | Resolves with a USBIsochronousInTransferResult when time sensitive information has been transmitted to (received by) the USB device | `Future<USBIsochronousInTransferResult>`  |
| `isochronousTransferOut(dynamic device, int endpointNumber, List<int> packetLengths)` | Resolves with a USBIsochronousOutTransferResult when time sensitive information has been transmitted from the USB device            | `Future<USBIsochronousOutTransferResult>` |
| `setOnConnectCallback(Function(dynamic) onConnect)`                                   | Connect callback                                                                                                                    | `Future`                                  |
| `setOnDisconnectCallback(Function(dynamic) onDisconnect)`                             | Disconnect callback                                                                                                                 | `Future`                                  |
| `getSelectedConfiguration(dynamic pairedDevice)`                                      | Get the selected configuration                                                                                                      | `Future<USBConfiguration?>`               |
| `getAvailableConfigurations(dynamic pairedDevice)`                                    | Get available device's configurations                                                                                               | `Future<List<USBConfiguration>>`          |
| `getPairedDeviceInfo(dynamic pairedDevice)`                                           | Get info of paired device                                                                                                           | `Future<USBDeviceInfo>`                   |

## 📣&nbsp; Sponsor

<img src="https://github.com/Apparence-io/bart/raw/master/.github/img/apparence_logo.png" alt="logo apparence io" />
<br />
<br />

[Initiated and sponsored by Apparence.io.](https://apparence.io)

## 👥&nbsp; Contribution

Contributions are welcome.
Contribute by creating a PR or create an issue 🎉.
