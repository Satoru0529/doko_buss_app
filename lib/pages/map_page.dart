import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  static const String API_KYE = "AIzaSyCsi4yLKlnTJb74RpUMfDiXrgwfa_gvsXI";

  final LatLng start = const LatLng(34.70263531930244, 135.49718441206556);

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget _createMap() {
    Widget Maps;

    Maps = GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      zoomControlsEnabled: false,
      initialCameraPosition: CameraPosition(
        target: start,
        zoom: 13,
      ),
      minMaxZoomPreference: MinMaxZoomPreference(11, 20),
    );

    return Maps;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _createMap());
  }
}
