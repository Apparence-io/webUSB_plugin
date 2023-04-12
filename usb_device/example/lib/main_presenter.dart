import 'dart:js_util';

import 'package:usb_device/usb_device.dart';

import 'main.dart';
import 'main_viewmodel.dart';

class MainPresenter {
  final MainViewModel viewModel;
  final MainView viewInterface;
  final UsbDevice _usbDevice = UsbDevice();

  MainPresenter(
    this.viewModel,
    this.viewInterface,
  );

  MainPresenter init() {
    this.viewModel.isLoading = true;
    this.viewModel.fabIsVisible = false;
    return this;
  }

  void initServices() async {}

  void loadData() async {
    this.viewModel.isLoading = true;
    this.viewModel.isSupported = await this._usbDevice.isSupported();
    await this.getPairedDevice();
    this.viewModel.isLoading = false;
    this.viewInterface.refresh();
  }

  Future getPairedDevice() async {
    final devices = await this._usbDevice.pairedDevices;
    if (devices.length > 0) {
      this.viewModel.fabIsVisible = true;
      this.viewModel.pairedDevice = devices.first;
    }
  }

  Future startSession() async {
    if (this.viewModel.pairedDevice != null) {
      await this._usbDevice.open(this.viewModel.pairedDevice!);
      this.viewInterface.refresh();
    }
  }

  Future closeSession() async {
    if (this.viewModel.pairedDevice != null) {
      await this._usbDevice.close(this.viewModel.pairedDevice!);
      this.viewInterface.refresh();
    }
  }

  void requestDevices() async {
    this.viewModel.pairedDevice = await this._usbDevice.requestDevices([]);
    this.viewModel.fabIsVisible = true;
    this.viewInterface.refresh();
  }

  Map<String, dynamic> getPairedDeviceInfo() {
    var pairedDevice = this.viewModel.pairedDevice;
    final USBConfiguration? currentConfiguration =
        getProperty(pairedDevice, 'configuration') == null
            ? null
            : _getCurrentUSBConfigurationInfo(
                getProperty(pairedDevice, 'configuration'));
    final List<USBConfiguration> configurations =
        _getAvailableUSBConfigurations(
            getProperty(pairedDevice, 'configurations'));

    try {
      return <String, dynamic>{
        'usbVersionMajor': getProperty(pairedDevice, 'usbVersionMajor'),
        'usbVersionMinor': getProperty(pairedDevice, 'usbVersionMinor'),
        'usbVersionSubminor': getProperty(pairedDevice, 'usbVersionSubminor'),
        'deviceClass': getProperty(pairedDevice, 'deviceClass'),
        'deviceSubclass': getProperty(pairedDevice, 'deviceSubclass'),
        'deviceProtocol': getProperty(pairedDevice, 'deviceProtocol'),
        'vendorId': getProperty(pairedDevice, 'vendorId'),
        'productId': getProperty(pairedDevice, 'productId'),
        'deviceVersionMajor': getProperty(pairedDevice, 'deviceVersionMajor'),
        'deviceVersionMinor': getProperty(pairedDevice, 'deviceVersionMinor'),
        'deviceVersionSubminor':
            getProperty(pairedDevice, 'deviceVersionSubminor'),
        'manufacturerName': getProperty(pairedDevice, 'manufacturerName'),
        'productName': getProperty(pairedDevice, 'productName'),
        'serialNumber': getProperty(pairedDevice, 'serialNumber'),
        'opened': getProperty(pairedDevice, 'opened'),
        'configurations': configurations,
        'actualConfiguration': currentConfiguration.toString()
      };
    } catch (e) {
      return <String, dynamic>{'Error:': 'Failed to get paired device info.'};
    }
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

  bool isDeviceOpen() {
    var pairedDevice = this.viewModel.pairedDevice;
    if (pairedDevice != null) {
      return getProperty(pairedDevice, 'opened');
    }
    return false;
  }

  void dispose() {}
}
