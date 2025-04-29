import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _googleMapController = Completer();

  final Location _location = Location();
  LatLng _userPosition = LatLng(32.059149, 35.877001);
  LatLng _providerPosition = LatLng(32.037277, 35.881276);

  StreamSubscription<LocationData>? _locationSubscription;

  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _initLocationTracking();
  }

  Future<void> _initLocationTracking() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    
    _locationSubscription = _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
     
        _userPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        _providerPosition = LatLng(
          currentLocation.latitude! + 0.0015, 
          currentLocation.longitude! + 0.0015,
        );

        _updatePolyline();
      });

      _moveCamera();
    });
  }

  void _updatePolyline() {
    _polylines = {
      Polyline(
        polylineId: const PolylineId("line"),
        points: [_userPosition, _providerPosition],
        color:  Color.fromRGBO(22, 121, 171, 1.0),
        width: 5,
      ),
    };
  }

  Future<void> _moveCamera() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(
          (_userPosition.latitude <= _providerPosition.latitude)
              ? _userPosition.latitude
              : _providerPosition.latitude,
          (_userPosition.longitude <= _providerPosition.longitude)
              ? _userPosition.longitude
              : _providerPosition.longitude,
        ),
        northeast: LatLng(
          (_userPosition.latitude > _providerPosition.latitude)
              ? _userPosition.latitude
              : _providerPosition.latitude,
          (_userPosition.longitude > _providerPosition.longitude)
              ? _userPosition.longitude
              : _providerPosition.longitude,
        ),
      ),
      100.0,
    ));
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _userPosition,
          zoom: 14,
        ),
        onMapCreated: (controller) {
          _googleMapController.complete(controller);
        },
        markers: {
          Marker(
            markerId: const MarkerId('user'),
            position: _userPosition,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(title: "User"),
          ),
          Marker(
            markerId: const MarkerId('provider'),
            position: _providerPosition,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: const InfoWindow(title: "Provider"),
          ),
        },
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
