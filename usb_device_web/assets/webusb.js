var WebUsbJS = function () {
  this.init();
};
WebUsbJS.prototype = {
  init: function () {
    this._navigator =
      typeof window !== "undefined" && window.navigator
        ? window.navigator
        : null;
    return this;
  },

  isSupported: function () {
    return this._navigator.usb != null;
  },

  // Pair device
  getPairedDevices: function () {
    return this._navigator.usb.getDevices();
  },

  requestDevice: function (filters) {
    return this._navigator.usb.requestDevice({ filters: filters });
  },

  setOnConnectCallback: function(callback) {
   this._navigator.usb.onconnect = ((event) => {
    callback(event.device);
    });
  },

  setOnDisconnectCallback: function(callback) {
     this._navigator.usb.ondisconnect = ((event) => {
      callback(event.device);
      });
    },

  // Session setup
  open: function (device) {
    return device.open();
  },

  close: function (device) {
    return device.close();
  },

  claimInterface: function (device, interfaceNumber) {
    return device.claimInterface(interfaceNumber);
  },

  releaseInterface: function (device, interfaceNumber) {
    return device.releaseInterface(interfaceNumber);
  },

  reset: function (device) {
    return device.reset();
  },

  selectConfiguration: function (device, configurationValue) {
    return device.selectConfiguration(configurationValue);
  },

  clearHalt: function (device, direction, endpointNumber) {
    return device.clearHalt(direction, endpointNumber);
  },

  // Data transfert
  controlTransferIn: function (device, setup, length) {
    return device.controlTransferIn(setup, length);
  },

  controlTransferOut: function (device, setup, data) {
    return device.controlTransferOut(setup, data);
  },

  transferIn: function (device, endpointNumber, length) {
    return device.transferIn(endpointNumber, length);
  },

  transferOut: function (device, endpointNumber, data) {
    return device.transferOut(endpointNumber, data);
  },

  isochronousTransferIn(device, endpointNumber, packetLengths) {
    return device.isochronousTransferIn(endpointNumber, packetLengths);
  },

  isochronousTransferOut(device, endpointNumber, packetLengths) {
    return device.isochronousTransferOut(endpointNumber, packetLengths);
  },
};
