import 'package:flutter/material.dart';
import 'package:mapbox_mapas/src/views/flull_screen_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: FullScreenMap(),
      ),
    );
  }
}