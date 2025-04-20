import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:store/features/common/ecommerce_app_bar.dart';
import '../manager/add_address_bloc.dart';
import '../manager/add_address_event.dart';
import '../manager/add_address_state.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(
        title: "New Address",
        actions: [SvgPicture.asset("assets/icons/notification.svg")],
      ),
      body: BlocBuilder<AddAddressBloc, AddAddressState>(
        builder:
            (context, state) => Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: context.read<AddAddressBloc>().controller,
                    options: MapOptions(
                      initialCenter: LatLng(
                        41.285799883900715,
                        69.20363493014382,
                      ),
                      onTap:
                          (tapPosition, point) =>
                              context.read<AddAddressBloc>().add(
                                NewAddressChooseLocation(chosenLocation: point),
                              ),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: state.markers),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Address: ${state.address}'),
                ),
              ],
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => context.read<AddAddressBloc>().add(GoToCurrentLocation()),
        tooltip: 'Go to current location',
        child: Icon(Icons.my_location),
      ),
    );
  }
}
