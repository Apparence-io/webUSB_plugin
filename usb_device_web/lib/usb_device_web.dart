@JS()
library usb_device_web;

import 'dart:async';
import 'dart:js_util';
import 'dart:typed_data';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:js/js.dart';
import 'package:usb_device_platform_interface/usb_device_platform_interface.dart';

import 'import_js/import_js_library.dart';

class WebUSBPlugin extends UsbDevicePlatform {
  late final WebUsbJS _webUsbJS;

  WebUSBPlugin() : this._webUsbJS = WebUsbJS();

  /// Factory method that initializes the Web device plugin platform with an instance
  /// of the plugin for the web.
  static void registerWith(Registrar registrar) async {
    await importJsLibrary(
        url: "./assets/webusb.js", flutterPluginName: "usb_device_web");
    UsbDevicePlatform.instance = WebUSBPlugin();
  }

  @override
  Future<bool> isSupported() {
    return Future.value(this._webUsbJS.isSupported());
  }

  @override
  Future<List<dynamic>> get pairedDevices async {
    return promiseToFuture(this._webUsbJS.getPairedDevices());
  }

  @override
  Future<dynamic> requestDevices(List<DeviceFilter> filters) async {
    List<DeviceFilterJS> filtersJS = [];
    for (var deviceFilter in filters) {
      filtersJS.add(DeviceFilterJS(
          vendorId: deviceFilter.vendorId, productId: deviceFilter.productId));
    }
    return promiseToFuture(this._webUsbJS.requestDevice(filtersJS));
  }

  @override
  Future open(dynamic device) async {
    return promiseToFuture(this._webUsbJS.open(device));
  }

  @override
  Future close(dynamic device) async {
    return promiseToFuture(this._webUsbJS.close(device));
  }

  @override
  Future claimInterface(dynamic device, int interfaceNumber) async {
    return promiseToFuture(
        this._webUsbJS.claimInterface(device, interfaceNumber));
  }

  @override
  Future releaseInterface(dynamic device, int interfaceNumber) async {
    return promiseToFuture(
        this._webUsbJS.releaseInterface(device, interfaceNumber));
  }

  @override
  Future reset(dynamic device) async {
    return promiseToFuture(this._webUsbJS.reset(device));
  }

  @override
  Future selectConfiguration(dynamic device, int configurationValue) async {
    return promiseToFuture(
        this._webUsbJS.selectConfiguration(device, configurationValue));
  }

  @override
  Future clearHalt(dynamic device, String direction, int endpointNumber) async {
    return promiseToFuture(
        this._webUsbJS.clearHalt(device, direction, endpointNumber));
  }

  @override
  Future<USBInTransferResult> controlTransferIn(
      dynamic device, SetupParam setup,
      {int? length}) async {
    var res = await promiseToFuture(this._webUsbJS.controlTransferIn(
        device,
        SetupParamJS(
            requestType: setup.requestType,
            recipient: setup.recipient,
            request: setup.request,
            value: setup.value,
            index: setup.index),
        length));
    return USBInTransferResult.fromDataJS(res);
  }

  @override
  Future<USBOutTransferResult> controlTransferOut(
      dynamic device, SetupParam setup,
      {dynamic data}) async {
    var res = await promiseToFuture(this._webUsbJS.controlTransferOut(
        device,
        SetupParamJS(
            requestType: setup.requestType,
            recipient: setup.recipient,
            request: setup.request,
            value: setup.value,
            index: setup.index),
        data));
    return USBOutTransferResult.fromDataJS(res);
  }

  @override
  Future<USBInTransferResult> transferIn(
      dynamic device, int endpointNumber, int length) async {
    try {
      var res = await promiseToFuture(
              this._webUsbJS.transferIn(device, endpointNumber, length))
          .timeout(Duration(milliseconds: 3000));

      return USBInTransferResult.fromDataJS(res);
    } on TimeoutException {
      return USBInTransferResult(
          data: Uint8List(0), status: StatusResponse.empty_data);
    } on Error catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<USBOutTransferResult> transferOut(
      dynamic device, int endpointNumber, dynamic data) async {
    var res = await promiseToFuture(
        this._webUsbJS.transferOut(device, endpointNumber, data));
    return USBOutTransferResult.fromDataJS(res);
  }

  @override
  Future<USBIsochronousInTransferResult> isochronousTransferIn(
      dynamic device, int endpointNumber, List<int> packetLengths) async {
    var res = await promiseToFuture(this
        ._webUsbJS
        .isochronousTransferIn(device, endpointNumber, packetLengths));
    return USBIsochronousInTransferResult.fromDataJS(res);
  }

  @override
  Future<USBIsochronousOutTransferResult> isochronousTransferOut(
      dynamic device, int endpointNumber, dynamic data) async {
    var res = await promiseToFuture(
        this._webUsbJS.isochronousTransferOut(device, endpointNumber, data));
    return USBIsochronousOutTransferResult.fromDataJS(res);
  }

  @override
  Future<void> setOnConnectCallback(Function(dynamic) onConnect) async {
    this._webUsbJS.setOnConnectCallback(allowInterop((device) {
      onConnect(device);
    }));
  }

  @override
  Future<void> setOnDisconnectCallback(Function(dynamic) onDisconnect) async {
    this._webUsbJS.setOnDisconnectCallback(allowInterop((device) {
      onDisconnect(device);
    }));
  }

  @override
  Future<USBConfiguration?> getSelectedConfiguration(
      dynamic pairedDevice) async {
    final USBConfiguration? currentConfiguration =
        getProperty(pairedDevice, 'configuration') == null
            ? null
            : _getCurrentUSBConfigurationInfo(
                getProperty(pairedDevice, 'configuration'));
    return currentConfiguration;
  }

  @override
  Future<List<USBConfiguration>> getAvailableConfigurations(
      dynamic pairedDevice) async {
    final List<USBConfiguration> configurations =
        _getAvailableUSBConfigurations(
            getProperty(pairedDevice, 'configurations'));
    return configurations;
  }

  /// Get info of paired device
  @override
  Future<USBDeviceInfo> getPairedDeviceInfo(dynamic pairedDevice) async {
    return USBDeviceInfo.fromDeviceJS(pairedDevice);
  }

  List<USBConfiguration> _getAvailableUSBConfigurations(
      List<dynamic> configurations) {
    return configurations
        .map((e) => USBConfiguration.fromConfiguration(e))
        .toList();
  }

  USBConfiguration _getCurrentUSBConfigurationInfo(dynamic configuration) {
    return USBConfiguration.fromConfiguration(configuration);
  }
}

// JS
@JS("WebUsbJS")
class WebUsbJS {
  external factory WebUsbJS();

  external bool isSupported();

  // Pair device
  external Promise getPairedDevices();

  external Promise requestDevice(List<DeviceFilterJS> filters);

  external setOnConnectCallback(Function(dynamic) callback);

  external setOnDisconnectCallback(Function(dynamic) callback);

  /// Session setup
  external Promise open(dynamic device);

  external Promise close(dynamic device);

  external Promise claimInterface(dynamic device, int interfaceNumber);

  external Promise releaseInterface(dynamic device, int interfaceNumber);

  external Promise reset(dynamic device);

  external Promise selectConfiguration(dynamic device, int configurationValue);

  external Promise clearHalt(
      dynamic device, String direction, int endpointNumber);

  /// Data transfer
  external Promise controlTransferIn(
      dynamic device, SetupParamJS setup, int? length);

  external Promise controlTransferOut(
      dynamic device, SetupParamJS setup, dynamic data);

  external Promise transferIn(dynamic device, int endpointNumber, int length);

  external Promise transferOut(
      dynamic device, int endpointNumber, dynamic data);

  external Promise isochronousTransferIn(
      dynamic device, int endpointNumber, List<int> packetLengths);

  external Promise isochronousTransferOut(
      dynamic device, int endpointNumber, dynamic data);
}

@JS()
@anonymous
class Promise {
  external void then(Function onFulfilled, Function onRejected);
}

@JS()
@anonymous
class DeviceFilterJS {
  external factory DeviceFilterJS({int vendorId, int productId});
}

@JS()
@anonymous
class SetupParamJS {
  external factory SetupParamJS({
    String requestType,
    String recipient,
    int request,
    int value,
    int index,
  });
}
