import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
   
  const FullScreenMap({Key? key}) : super(key: key);

  @override
  State<FullScreenMap> createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {

    
    MapboxMapController? mapController;

    _onMapCreated(MapboxMapController controller) {
      mapController = controller;
    }

    final LatLng center = LatLng(10.1923226, -64.6841399);

    // estilo creado personalizado en https://studio.mapbox.com/.. lo copie desde Style URL
    var selectedStyle = 'mapbox://styles/jcc9638/cl5twvcjk001w15payzt6ao7v';
    final oscuroStyle = 'mapbox://styles/jcc9638/cl5twvcjk001w15payzt6ao7v';
    final streetStyle = 'mapbox://styles/jcc9638/cl5twyqdy000t14tdw50rj51f';

    _onStyleLoadedCallback() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("Style loaded :)"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 1),
      ));
    }

    final apiMapBox = dotenv.env['MAPBOX_TOKEN_STYLES']; // MAPBOX_TOKEN_STYLES   MAPBOX_TOKEN
    var isLight = true;
  @override
  Widget build(BuildContext context) { 
    return Scaffold( 
      // appBar: AppBar(
      //   title: Center(child: Text('Hola Mundo')),
      // ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.swap_horiz),
        onPressed: () {
          selectedStyle == oscuroStyle
            ? selectedStyle = streetStyle
            : selectedStyle = oscuroStyle;
          setState(() { 
            print(selectedStyle);
          });
        }
      ), 
      body: MapboxMap(
        styleString: selectedStyle, 
        // styleString: isLight ? MapboxStyles.LIGHT : MapboxStyles.DARK,
        // TODO sin este token accessToken la aplicacion REBIENTA OJO
        accessToken: apiMapBox,
        onMapCreated: _onMapCreated,
        initialCameraPosition: 
          CameraPosition(
            target: center,
            zoom: 13
          ),
        onStyleLoadedCallback: _onStyleLoadedCallback,
      ),
    );
  }
} 