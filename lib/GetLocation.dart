import 'package:geolocator/geolocator.dart';

class GetLocation {
  //Get current location
  Future getCurrentLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      print(e);
    }
  }
}
