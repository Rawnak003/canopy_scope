import 'package:geolocator/geolocator.dart';

class LocationService {
  late Position currentPosition;

  Future<Position> getCurrentLocation() async {
    bool isPermissionEnabled = await _isLocationPermissionEnabled();
    if (isPermissionEnabled) {
      bool isGpsServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (isGpsServiceEnabled) {
        Position position = await Geolocator.getCurrentPosition();
        currentPosition = position;
      } else {
        await Geolocator.openLocationSettings();
      }
    } else {
      bool isPermissionGranted = await _requestPermission();
      if (isPermissionGranted) {
        await getCurrentLocation();
      }
    }
    return currentPosition;
  }

  Future<bool> _isLocationPermissionEnabled() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      return true;
    } else {
      return false;
    }
  }
}