import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../api_key/apis_key.dart';

class FullScreenMap extends StatefulWidget {
   
  const FullScreenMap({Key? key}) : super(key: key);

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  @override
  Widget build(BuildContext context) {

    // return Container();
    
    MapboxMapController? mapController;
    var isLight = true;

    _onMapCreated(MapboxMapController controller) {
      mapController = controller;
    }

    _onStyleLoadedCallback() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Style loaded :)"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 1),
      ));
    }
 
    // const accessToken = String.fromEnvironment("MAPBOX_DOWNLOADS_TOKEN");

    // print('Token: $accessToken');

    return Scaffold(
      body: MapboxMap(
        // styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
        // TODO sin este token accessToken la aplicacion REBIENTA OJO
        accessToken: ApisKey.apiMapBox,
        onMapCreated: _onMapCreated,
        initialCameraPosition: 
          const CameraPosition(
            target: LatLng(10.1923226, -64.6841399),
            zoom: 13
          ),
        onStyleLoadedCallback: _onStyleLoadedCallback,
      ),
    );
  }
}