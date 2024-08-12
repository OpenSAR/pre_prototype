import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  // Pass your access token to MapboxOptions so you can load a map
  String token = dotenv.get('MAPBOX_TOKEN');
  MapboxOptions.setAccessToken(token);

  // Define options for your camera
  CameraOptions camera = CameraOptions(
      center: Point(coordinates: Position(-105.15, 38.87)),
      zoom: 13,
      bearing: 0,
      pitch: 0);

  // Run your application, passing your CameraOptions to the MapWidget
  runApp(MaterialApp(
      home: MapWidget(
    cameraOptions: camera,
    styleUri: MapboxStyles.OUTDOORS,
  )));
}
