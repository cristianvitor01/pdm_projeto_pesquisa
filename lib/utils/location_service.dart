import 'package:geolocator/geolocator.dart';

class LocationService {
  static const double latitudePermitida = -4.819542825582025;
  static const double longitudePermitida = -43.34320473152245;
  static const double raioPermitidoEmMetros = 100;




  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }

    if (permission == LocationPermission.deniedForever) return null;

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  static Future<bool> estaNoPerimetroPermitido() async {
    Position? position = await getCurrentLocation();
    if (position == null) return false;

    double distancia = Geolocator.distanceBetween(
      latitudePermitida,
      longitudePermitida,
      position.latitude,
      position.longitude,
    );

    return distancia <= raioPermitidoEmMetros;
  }
}
