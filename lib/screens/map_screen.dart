import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weatherapp_starter_project/api/fetch_spots.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Set<Marker> spotMarkers = {const Marker(markerId: MarkerId("test"), position: LatLng(0, 0))};
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(52.206133, 0.12119293),
    zoom: 8,
  );
  GoogleMapController? _controller;
  Position? currentLocation;

  @override
  void initState() {
    super.initState();
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
        .then((location) {
      currentLocation = location;
      _controller?.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(currentLocation!.latitude, currentLocation!.longitude), 8));
    });
    FetchSpotsAPI().getSpots().then((spots){
      Set<Marker> newMarkers = {};
      for(var spot in spots){
        newMarkers.add(Marker(
          position: LatLng(spot.lat, spot.lng),
          markerId: MarkerId(spot.url.toString()),
          infoWindow: InfoWindow(title: spot.name, snippet: spot.loc, onTap: ((){
            launchUrl(spot.url, mode: LaunchMode.externalApplication);
          })),

        ));
      }
      setState((){
        spotMarkers = newMarkers;
      });
    });

  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller!.setMapStyle(value);
    if (currentLocation != null) {
      _controller!.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(currentLocation!.latitude, currentLocation!.longitude), 8));
    }
  }


@override
Widget build(BuildContext context) {
  return Stack(
    children: <Widget>[
      GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: onMapCreated,
        markers: spotMarkers,
      ),
      Positioned(
        top: 60,
        right: 20,
        left: 20,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white),
          child: Row(
            children: <Widget>[
              IconButton(
                splashColor: Colors.grey,
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              const Expanded(
                child: TextField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 15),
                      hintText: "Search..."),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}}