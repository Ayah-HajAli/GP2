import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(32.059149, 35.877001), 
    zoom: 18,
  );

  static const CameraPosition _asuPosition = CameraPosition(
    target: LatLng(32.059149, 35.877001), 
    tilt: 59.440717697143555,
    zoom: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          const Marker(
            markerId: MarkerId('asu'),
            position: LatLng(32.059149, 35.877001),
            infoWindow: InfoWindow(
              title: 'Applied Science University',
              snippet: 'Shafa Badran, Amman, Jordan',
            ),
          )
        },
      ),
     
    );
  }

  Future<void> _goToASU() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_asuPosition));
  }
}
