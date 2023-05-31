import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_app/constants.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(38.9573415, 35.240741), zoom: 12);

  @override
  Widget build(BuildContext context) {
    // List<Marker> allMarkers = [];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maps',
        ),
        backgroundColor: Constants.primaryColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 50,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          //markers: Set.from(allMarkers),
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
