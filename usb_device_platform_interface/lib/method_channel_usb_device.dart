import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:usb_device_platform_interface/usb_device_platform_interface.dart';

/// An implementation of [UsbDevicePlatform] that uses method channels.
class MethodChannelUsbDevice extends UsbDevicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  MethodChannel methodChannel = MethodChannel('apparence.io/usbdevice');

  @override
  Future<List<dynamic>> get pairedDevices => methodChannel
      .invokeMethod<int>('getDevices')
      .then<List<dynamic>>((dynamic result) => result);

  @override
  Future<bool> isSupported() {
    return methodChannel
        .invokeMethod<bool>('isSupported')
        .then<bool>((dynamic result) => result);
  }

  @override
  Future<dynamic> requestDevices(List<DeviceFilter> filters) {
    return methodChannel
        .invokeMethod<bool>('requestDevices', filters)
        .then<dynamic>((dynamic result) => result);
  }

  @override
  Future<void> setOnConnectCallback(Function(dynamic) onConnect) {
    return methodChannel
        .invokeMethod<bool>('setOnConnectCallback', onConnect)
        .then<void>((dynamic result) => result);
  }

  @override
  Future<void> setOnDisconnectCallback(Function(dynamic) onDisconnect) {
    return methodChannel
        .invokeMethod<bool>('setOnDisconnectCallback', onDisconnect)
        .then<void>((dynamic result) => result);
  }

  @override
  Future<List<USBConfiguration>> getAvailableConfigurations(
      dynamic pairedDevice) {
    return methodChannel
        .invokeMethod<bool>('getAvailableConfigurations', pairedDevice)
        .then<List<USBConfiguration>>((dynamic result) => result);
  }

  @override
  Future<USBConfiguration?> getSelectedConfiguration(dynamic pairedDevice) {
    return methodChannel
        .invokeMethod<bool>('getSelectedConfiguration', pairedDevice)
        .then<USBConfiguration>((dynamic result) => result);
  }

  @override
  Future<USBDeviceInfo> getPairedDeviceInfo(dynamic pairedDevice) async {
    return methodChannel
        .invokeMethod<bool>('getPairedDeviceInfo', pairedDevice)
        .then<USBDeviceInfo>((dynamic result) => result);
  }

  @override
  Future open(dynamic device) {
    return methodChannel
        .invokeMethod<bool>('open')
        .then<void>((dynamic result) => result);
  }

  @override
  Future close(dynamic device) {
    return methodChannel
        .invokeMethod<bool>('close', device)
        .then<void>((dynamic result) => result);
  }

  @override
  Future claimInterface(dynamic device, int interfaceNumber) {
    return methodChannel.invokeMethod<bool>('claimInterface',
        [device, interfaceNumber]).then<void>((dynamic result) => result);
  }

  @override
  Future releaseInterface(dynamic device, int interfaceNumber) {
    return methodChannel.invokeMethod<bool>('releaseInterface',
        [device, interfaceNumber]).then<void>((dynamic result) => result);
  }

  @override
  Future reset(dynamic device) {
    return methodChannel
        .invokeMethod<bool>('reset', device)
        .then<void>((dynamic result) => result);
  }

  @override
  Future selectConfiguration(dynamic device, int configurationValue) {
    return methodChannel.invokeMethod<bool>('selectConfiguration',
        [device, configurationValue]).then<void>((dynamic result) => result);
  }

  @override
  Future clearHalt(dynamic device, String direction, int endpointNumber) {
    return methodChannel.invokeMethod<bool>('clearHalt', [
      device,
      direction,
      endpointNumber
    ]).then<void>((dynamic result) => result);
  }

  @override
  Future<USBInTransferResult> controlTransferIn(
      dynamic device, SetupParam setup,
      {int? length}) {
    return methodChannel.invokeMethod<bool>('controlTransferIn', [
      device,
      setup,
      length
    ]).then<USBInTransferResult>((dynamic result) => result);
  }

  @override
  Future<USBOutTransferResult> controlTransferOut(
      dynamic device, SetupParam setup,
      {dynamic data}) {
    return methodChannel.invokeMethod<bool>('controlTransferOut', [
      device,
      setup,
      data
    ]).then<USBOutTransferResult>((dynamic result) => result);
  }

  @override
  Future<USBInTransferResult> transferIn(
      dynamic device, int endpointNumber, int length) {
    return methodChannel.invokeMethod<bool>('transferIn', [
      device,
      endpointNumber,
      length
    ]).then<USBInTransferResult>((dynamic result) => result);
  }

  @override
  Future<USBOutTransferResult> transferOut(
      dynamic device, int endpointNumber, dynamic data) {
    return methodChannel.invokeMethod<bool>('transferOut', [
      device,
      endpointNumber,
      data
    ]).then<USBOutTransferResult>((dynamic result) => result);
  }

  @override
  Future<USBIsochronousInTransferResult> isochronousTransferIn(
      dynamic device, int endpointNumber, List<int> packetLengths) {
    return methodChannel.invokeMethod<bool>('isochronousTransferIn', [
      device,
      endpointNumber,
      packetLengths
    ]).then<USBIsochronousInTransferResult>((dynamic result) => result);
  }

  @override
  Future<USBIsochronousOutTransferResult> isochronousTransferOut(
      dynamic device, int endpointNumber, dynamic data) {
    return methodChannel.invokeMethod<bool>('isochronousTransferOut', [
      device,
      endpointNumber,
      data
    ]).then<USBIsochronousOutTransferResult>((dynamic result) => result);
  }
}
