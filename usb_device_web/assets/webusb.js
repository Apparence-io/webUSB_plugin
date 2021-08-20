
class WebUsbJS {
  WebUsbJS(){
  }

  isSupported() {
    return window.navigator.usb != null;
  }

  // Pair device
  getPairedDevices() {
    return window.navigator.usb.getDevices();
  }

  requestDevice(filters) {
    return window.navigator.usb.requestDevice({ filters: filters });
  }

  setOnConnectCallback(callback) {
    window.navigator.usb.onconnect = ((event) => {
      callback(event.device);
      });
  }

  setOnDisconnectCallback(callback) {
    window.navigator.usb.ondisconnect = ((event) => {
      callback(event.device);
      });
    }

  // Session setup
  open(device) {
    return device.open();
  }

  close(device) {
    return device.close();
  }

  claimInterface(device, interfaceNumber) {
    return device.claimInterface(interfaceNumber);
  }

  releaseInterface(device, interfaceNumber) {
    return device.releaseInterface(interfaceNumber);
  }

  reset(device) {
    return device.reset();
  }

  selectConfiguration(device, configurationValue) {
    return device.selectConfiguration(configurationValue);
  }

  clearHalt(device, direction, endpointNumber) {
    return device.clearHalt(direction, endpointNumber);
  }

  // Data transfert
  controlTransferIn (device, setup, length) {
    return device.controlTransferIn(setup, length);
  }

  controlTransferOut(device, setup, data) {
    return device.controlTransferOut(setup, data);
  }

  transferIn(device, endpointNumber, length) {
    return device.transferIn(endpointNumber, length);
  }

  transferOut (device, endpointNumber, data) {
    return device.transferOut(endpointNumber, data);
  }

  isochronousTransferIn(device, endpointNumber, packetLengths) {
    return device.isochronousTransferIn(endpointNumber, packetLengths);
  }

  isochronousTransferOut(device, endpointNumber, packetLengths) {
    return device.isochronousTransferOut(endpointNumber, packetLengths);
  }
}

window.WebUsbJS = WebUsbJS
