void main() {
  var pixel = Phone('Pixel XL', 'HTC');
  pixel.getDeviceInfo();
  pixel.getAllFeatures();
}

mixin FeauturesMixin {
  bool blueTooth = true;
  bool dualSim = false;
  bool nfc = true;
}

mixin UtilitiesMixin on FeauturesMixin {
  bool calculator = true;
  bool flashlight = true;
  bool thermometer = false;

  String _has(bool feature) => feature ? '✔' : '✖';

  void getAllFeatures() => print("""
  --- Features ---
  ${_has(super.blueTooth)}: Bluetooth
  ${_has(super.dualSim)}: Dual Sim
  ${_has(super.nfc)}: NFC
  ${_has(calculator)}: Calculator
  ${_has(flashlight)}: Flash Light
  ${_has(thermometer)}: Thermometer
  """);
}

abstract class Device {
  String name;
  String manufacturer;
  void getDeviceInfo();
}

class Phone with FeauturesMixin, UtilitiesMixin implements Device {
  @override
  String manufacturer;

  @override
  String name;

  Phone(this.name, this.manufacturer);

  @override
  void getDeviceInfo() {
    print('''
    ===
    Device name: $name
    Manufactured by: $manufacturer
    ''');
  }
}
