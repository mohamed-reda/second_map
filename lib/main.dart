import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:second_map/my_location.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Location location;

  GoogleMapController mapController;

  LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
//  @override
//  void initState(){
//    getLocation();
//    super.initState();
//
//  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onCameraIdle: (){
            print(mapController.getLatLng);
          },
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
//            LatLng(position.latitude??45.521563, position.longitude??-122.677433),
            zoom: 11.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
//
            getLocation();
          },
        ),
      ),
    );
  }

  getLocation () {
    setState(() async{
      location = Location();
      location = await location.getLocation();
      _center = LatLng(location.longitude, location.latitude);
    });
  }
}