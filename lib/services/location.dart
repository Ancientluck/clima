import 'package:geolocator/geolocator.dart';

class Location{
    late double latitute;
    late double logitude;
    Future<Position?> determinePosition() async {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error('Location Not Available');
        }
      }
      Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitute=position.latitude;
      logitude =position.longitude;
      print(position);
      return position;
    }
}