import 'dart:typed_data';

import 'package:usb_device_platform_interface/usb_device_platform_interface.dart';

export 'package:usb_device_platform_interface/usb_device_platform_interface.dart';

class UsbDevice {
  /// Constructs a singleton instance of [UsbDeviceService].
  ///
  /// [UsbDeviceService] is designed to work as a singleton.
  factory UsbDevice() {
    _singleton ??= UsbDevice._();
    return _singleton!;
  }

  UsbDevice._();

  static UsbDevice? _singleton;

  static UsbDevicePlatform get _platform {
    return UsbDevicePlatform.instance;
  }

  /// Get paired devices
  Future<List<dynamic>> get pairedDevices {
    return _platform.pairedDevices;
  }

  /// Return true if  web usb supported
  Future<bool> isSupported() {
    return _platform.isSupported();
  }

  /// Pair a device
  Future<dynamic> requestDevices(List<DeviceFilter> filters) {
    return _platform.requestDevices(filters);
  }

  /// set on connect function callback
  Future<void> setOnConnectionCallback(Function(dynamic) onConnect) async {
    return _platform.setOnConnectCallback((device) => onConnect(device));
  }

  /// Set on disconnect function callback
  Future<void> setOnDisconnectCallback(Function(dynamic) onDisconnect) async {
    return _platform.setOnDisconnectCallback((device) => onDisconnect(device));
  }

  /// get device's info like productId, vendorId, USB version etc..
  Future<USBDeviceInfo> getPairedDeviceInfo(dynamic pairedDevice) {
    return _platform.getPairedDeviceInfo(pairedDevice);
  }

  /// Get available configuration in device
  Future<List<USBConfiguration>> getAvailableConfigurations(
      dynamic pairedDevice) {
    return _platform.getAvailableConfigurations(pairedDevice);
  }

  /// get selected configuration of paired device
  Future<USBConfiguration?> getSelectedConfiguration(dynamic pairedDevice) {
    return _platform.getSelectedConfiguration(pairedDevice);
  }

  /// Start session with the device
  Future open(dynamic device) {
    return _platform.open(device);
  }

  /// close session with the device
  Future close(dynamic device) {
    return _platform.close(device);
  }

  /// Claims the interface of the device
  Future claimInterface(dynamic device, int interfaceNumber) {
    return _platform.claimInterface(device, interfaceNumber);
  }

  /// Release interface
  Future releaseInterface(dynamic device, int interfaceNumber) {
    return _platform.releaseInterface(device, interfaceNumber);
  }

  /// Reset device
  Future reset(dynamic device) {
    return _platform.reset(device);
  }

  /// Select the configuration of the device.
  Future selectConfiguration(dynamic device, int configurationValue) async {
    await _platform.selectConfiguration(device, configurationValue);
  }

  Future clearHalt(dynamic device, String direction, int endpointNumber) {
    return _platform.clearHalt(device, direction, endpointNumber);
  }

  /// Waits for a specified control transfer from the device
  Future<USBInTransferResult> controlTransferIn(
      dynamic device, SetupParam setup,
      {int? length}) {
    return _platform.controlTransferIn(device, setup, length: length);
  }

  /// Sends a specified control transfer to the device
  Future<USBOutTransferResult> controlTransferOut(
      dynamic device, SetupParam setup,
      {dynamic data}) {
    return _platform.controlTransferOut(device, setup, data: data);
  }

  /// get data from usb device
  Future<USBInTransferResult> transferIn(
      dynamic device, int endpointNumber, int length) {
    return _platform.transferIn(device, endpointNumber, length);
  }

  /// send data to usb
  Future<USBOutTransferResult> transferOut(
      dynamic device, endpointNumber, ByteBuffer data) {
    return _platform.transferOut(device, endpointNumber, data);
  }

  Future<USBIsochronousOutTransferResult> isochronousTransferOut(
      dynamic device, endpointNumber, ByteBuffer data) {
    return _platform.isochronousTransferOut(device, endpointNumber, data);
  }

  Future<USBIsochronousInTransferResult> isochronousTransferIn(
      dynamic device, endpointNumber, List<int> packetLengths) {
    return _platform.isochronousTransferIn(
        device, endpointNumber, packetLengths);
  }
}
