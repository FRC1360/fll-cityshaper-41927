import '../Constants.dart';
import '../Data.dart';

class Park {
  String address;
  double size;
  String name;

  Park(String address, double size, String name) {
    this.address = address;
    this.size = size;
    this.name = name;
  }
  Park.fromString(String parkData) {
     List<String> dat = parkData.split(Constants.seperator);
     this.address = dat[0];
     this.size = double.tryParse(dat[1])  ?? 0.0;
     this.name = dat[2];
  }

  bool validate() {
    return address.isNotEmpty && size >= 0 && name.isNotEmpty && Data.getPark(name) == null;
  }

  String toStorableString() {
    return address + Constants.seperator +
          size.toString() + Constants.seperator +
          name + Constants.seperator;
  }
}