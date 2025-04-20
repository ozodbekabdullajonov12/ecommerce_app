import 'package:latlong2/latlong.dart';

sealed class AddAddressEvent {}

final class GoToCurrentLocation extends AddAddressEvent {}

final class NewAddressChooseLocation extends AddAddressEvent {
  final LatLng chosenLocation;

  NewAddressChooseLocation({required this.chosenLocation});
}