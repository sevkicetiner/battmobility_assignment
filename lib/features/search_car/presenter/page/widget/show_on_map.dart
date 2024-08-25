import 'dart:async';
import 'package:battmobility_assignment/features/common/constants.dart';
import 'package:battmobility_assignment/features/search_car/data/model/search_entity.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowOnMaps extends StatefulWidget {
  SearchResponse? response;

  ShowOnMaps({super.key, required this.response});

  @override
  State<ShowOnMaps> createState() => _ShowOnMapsState();
}

class _ShowOnMapsState extends State<ShowOnMaps> {
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  late GoogleMapController mapController;
  List<MarkerData> _customMarkers = [];
  Position? _currentPosition;

  @override
  void initState() {
    _determinePosition().then((value) {
      _currentPosition = value;
      _customMarkers = [
        ...widget.response!.vehicles!
            .map((item) => MarkerData(
                marker: Marker(
                    markerId: MarkerId(item.id!),
                    position: LatLng(item.homePosition!.latitude!,
                        item.homePosition!.longitude!),
                    onTap: () {
                      showVehicleDitails(item);
                    }),
                child:
                    _customMarkerCircleImage(item.imageUrl ?? "", Colors.blue)))
            .toList()
      ];
      setState(() {});
    });
    super.initState();
  }

  Future<dynamic> showVehicleDitails(SearchVehicles item) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Container(
              height: 300,
              child: Center(
                child: Text(item.description!),
              ),
            ),
          );
        }));
  }

  _customMarkerCircleImage(String text, Color color) {
    return CircleAvatar(
      radius: 20.0,
      backgroundImage: NetworkImage(
        "${BASE_URL}${text}",
        scale: 0.3,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGoogleMapMarkerBuilder(
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: (_currentPosition != null)
                  ? LatLng(
                      _currentPosition!.latitude, _currentPosition!.longitude)
                  : LatLng(37.42796133580664, -122.085749655962),
              zoom: 10.4746,
            ),
            markers: markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          );
        },
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
