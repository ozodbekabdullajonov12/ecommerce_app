import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'add_address_event.dart';
import 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(AddAddressState.initial()) {
    on<GoToCurrentLocation>(_onGoToCurrentLocation);
    on<NewAddressChooseLocation>(_onChooseLocation);
  }

  final controller = MapController();
  Future<void> _onGoToCurrentLocation(GoToCurrentLocation event, Emitter<AddAddressState> emit) async {
    var status = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }

    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.best),
      );
      final currentPosition = LatLng(position.latitude, position.longitude);
      controller.move(currentPosition, controller.camera.zoom);
      emit(
        state.copyWith(
          currentLocation: currentPosition,
          markers: [
            Marker(
              point: currentPosition,
              width: 40,
              height: 40,
              child: Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
      );

      final placeMarks = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);

      if (placeMarks.isNotEmpty) {
        Placemark p = placeMarks.first;
        final addressString = '${p.country}, ${p.administrativeArea}, ${p.locality}, ${p.street}, ${p.name}';
        emit(state.copyWith(address: addressString));
      }
    }
  }

  Future<void> _onChooseLocation(NewAddressChooseLocation event, Emitter<AddAddressState> emit)async{
    final currentPosition = LatLng(event.chosenLocation.latitude, event.chosenLocation.longitude);

    controller.move(currentPosition, controller.camera.zoom);
    emit(
      state.copyWith(
        currentLocation: currentPosition,
        markers: [
          Marker(
            point: currentPosition,
            width: 40,
            height: 40,
            child: Icon(Icons.location_on, color: Colors.red, size: 40),
          ),
        ],
      ),
    );

    List<Placemark> placeMarks = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);

    if (placeMarks.isNotEmpty) {
      Placemark p = placeMarks.first;
      final addressString = '${p.country}, ${p.administrativeArea}, ${p.locality}, ${p.street}, ${p.name}';
      emit(state.copyWith(address: addressString));
    }
  }
}