import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:usb_device_platform_interface/method_channel_usb_device.dart';
import 'package:usb_device_platform_interface/models/configurations/usb_configuration.dart';
import 'package:usb_device_platform_interface/models/configurations/usb_device_info.dart';
import 'package:usb_device_platform_interface/models/param/device_filter.dart';
import 'package:usb_device_platform_interface/models/param/setup_param.dart';

import 'models/transfer/usb_in_transfer_result.dart';
import 'models/transfer/usb_isochronous_in_transfer_result.dart';
import 'models/transfer/usb_isochronous_out_transfer_result.dart';
import 'models/transfer/usb_out_transfer_result.dart';

export 'package:usb_device_platform_interface/models/configurations/usb_interface.dart';
export 'package:usb_device_platform_interface/models/configurations/usb_alternate_interface.dart';
export 'package:usb_device_platform_interface/models/configurations/usb_device_info.dart';
export 'package:usb_device_platform_interface/models/configurations/usb_configuration.dart';
export 'package:usb_device_platform_interface/models/configurations/usb_endpoint.dart';
export 'package:usb_device_platform_interface/models/param/setup_param.dart';
export 'package:usb_device_platform_interface/models/param/device_filter.dart';
export 'package:usb_device_platform_interface/models/transfer/usb_in_transfer_result.dart';
export 'package:usb_device_platform_interface/models/transfer/usb_out_transfer_result.dart';
export 'package:usb_device_platform_interface/models/transfer/usb_isochronous_in_transfer_result.dart';
export 'package:usb_device_platform_interface/models/transfer/usb_isochronous_out_transfer_result.dart';
export 'package:usb_device_platform_interface/models/transfer/response/status_response.dart';

abstract class UsbDevicePlatform extends PlatformInterface {
  static final Object _token = Object();

  /// Constructs a UsbDevicePlatform.
  UsbDevicePlatform() : super(token: _token);

  static UsbDevicePlatform _instance = MethodChannelUsbDevice();

  /// The default instance of [UsbDevicePlatform] to use.
  ///
  /// Defaults to [MethodChannelUsbDevice].
  static UsbDevicePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UsbDevicePlatform] when they register themselves.
  static set instance(UsbDevicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns usb devices
  Future<List<dynamic>> get pairedDevices {
    throw UnimplementedError('devices() has not been implemented.');
  }

  /// Returns true if web usb is supported
  Future<bool> isSupported() {
    throw UnimplementedError('isSupported() has not been implemented.');
  }

  /// Returns a Future with the device object that matches the specified filter by predefined vendor ID, product ID, class or subclass code, protocol code or serial number.
  Future<dynamic> requestDevices(List<DeviceFilter> filters) {
    throw UnimplementedError('requestDevices() has not been implemented.');
  }

  /// Set functions to get a callback when the paired device is connect
  Future<void> setOnConnectCallback(Function(dynamic) onConnect) {
    throw UnimplementedError(
        'setOnConnectCallback() has not been implemented.');
  }

  /// Set functions to get a callback when the paired device is disconnect
  Future<void> setOnDisconnectCallback(Function(dynamic) onDisconnect) {
    throw UnimplementedError(
        'setOnDisconnectCallback() has not been implemented.');
  }

  /// Returns a Future that resolves when a device session has started.
  Future open(dynamic device) {
    throw UnimplementedError('open() has not been implemented.');
  }

  /// Return a map of paired device's info
  Future<USBDeviceInfo> getPairedDeviceInfo(dynamic pairedDevice) async {
    throw UnimplementedError('getPairedDeviceInfo() has not been implemented.');
  }

  /// Return a list of available configuration to be selected
  Future<List<USBConfiguration>> getAvailableConfigurations(
      dynamic pairedDevice) {
    throw UnimplementedError(
        'getAvailableConfiguration() has not been implemented.');
  }

  Future<USBConfiguration?> getSelectedConfiguration(dynamic pairedDevice) {
    throw UnimplementedError(
        'getSelectedConfiguration() has not been implemented.');
  }

  /// Returns a Future that resolves when all open interfaces are released and the device session has ended.
  Future close(dynamic device) {
    throw UnimplementedError('close() has not been implemented.');
  }

  /// Claims the interface of the device (by the number specified in configuration.interfaces)
  Future claimInterface(dynamic device, int interfaceNumber) {
    throw UnimplementedError('claimInterface() has not been implemented.');
  }

  /// Returns a Future that resolves when a claimed interface is released from exclusive access
  Future releaseInterface(dynamic device, int interfaceNumber) {
    throw UnimplementedError('releaseInterface() has not been implemented.');
  }

  /// Returns a Future that resolves when the device is reset and all app operations canceled and their promises rejected
  Future reset(dynamic device) {
    throw UnimplementedError('reset() has not been implemented.');
  }

  /// Select the configuration of the device. Returns a Future resolved when the setup has been applied.
  Future selectConfiguration(dynamic device, int configurationValue) {
    throw UnimplementedError('selectConfiguration() has not been implemented.');
  }

  ///Returns a Future that resolves when a halt condition is cleared.
  Future clearHalt(dynamic device, String direction, int endpointNumber) {
    throw UnimplementedError('clearHalt() has not been implemented.');
  }

  /// Waits for a specified control transfer from the device. Returns a Future resolved with the transfer data and status.
  Future<USBInTransferResult> controlTransferIn(
      dynamic device, SetupParam setup,
      {int? length}) {
    throw UnimplementedError('controlTransferIn() has not been implemented.');
  }

  /// Sends a specified control transfer to the device. Returns the Future resolved with the transfer status and the number of bytes written
  Future<USBOutTransferResult> controlTransferOut(
      dynamic device, SetupParam setup,
      {dynamic data}) {
    throw UnimplementedError('controlTransferOut() has not been implemented.');
  }

  ///Waits for a bulk or interrupt transfer from the device on a specified endpoint. Returns the Future resolved with the transfer data and status.
  Future<USBInTransferResult> transferIn(
      dynamic device, int endpointNumber, int length) {
    throw UnimplementedError('transferIn() has not been implemented.');
  }

  ///Sends a bulk or interrupt transfer to the specified endpoint of the device. Returns the Future resolved with the transfer status and the number of bytes written.
  Future<USBOutTransferResult> transferOut(
      dynamic device, int endpointNumber, dynamic data) {
    throw UnimplementedError('transferOut() has not been implemented.');
  }

  ///Returns a Future that resolves when time sensitive information has been transmitted to the USB device.
  Future<USBIsochronousInTransferResult> isochronousTransferIn(
      dynamic device, int endpointNumber, List<int> packetLengths) {
    throw UnimplementedError(
        'isochronousTransferIn() has not been implemented.');
  }

  /// Returns a Future that resolves when time sensitive information has been transmitted from the USB device.
  Future<USBIsochronousOutTransferResult> isochronousTransferOut(
      dynamic device, int endpointNumber, dynamic data) {
    throw UnimplementedError(
        'isochronousTransferOut() has not been implemented.');
  }
}
