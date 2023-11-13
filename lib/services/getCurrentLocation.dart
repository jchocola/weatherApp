import 'package:geolocator/geolocator.dart';


class MY_POSITION {
  double latitude = 0;
  double longtitude = 0;

//get longtitude and latitude using geolocator library
// returns Position object and print long-latitude in console
  void getCurrentLocation() async
  {
    // check Permission
    LocationPermission permission = await Geolocator.checkPermission();
    //request Permission to get Location
    permission = await Geolocator.requestPermission();

    //get current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude;
    longtitude = position.longitude;
    print(position);
  }
}