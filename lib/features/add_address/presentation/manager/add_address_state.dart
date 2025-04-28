
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddAddressState extends Equatable {
  final LatLng? currentLocation;
  final String? address;
  final List<Marker> markers;

  const AddAddressState({required this.currentLocation, required this.address, required this.markers});

  factory AddAddressState.initial() {

    return AddAddressState(currentLocation: null, address: null, markers: []);
  }

  AddAddressState copyWith({LatLng? currentLocation, String? address, List<Marker>? markers}) {
    return AddAddressState(
      currentLocation: currentLocation ?? this.currentLocation,
      address: address ?? this.address,
      markers: markers ?? this.markers,
    );
  }

  @override
  List<Object?> get props => [currentLocation, address, markers];
}

