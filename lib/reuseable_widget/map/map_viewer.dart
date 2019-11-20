import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapViewer extends StatefulWidget {
  final double latitude;
  final double longitude;

  MapViewer({
    this.latitude,
    this.longitude,
  });

  @override
  State<MapViewer> createState() => MapViewerState();
}

class MapViewerState extends State<MapViewer> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Completer<GoogleMapController> _controller = Completer();

  initData() async {
    if (widget.latitude != null && widget.longitude != null) {
      // currentLatitude = widget.latitude;
      // currentLongitude = widget.longitude;
      currentLatitude = -6.1867937;
      currentLongitude = 106.8205608;
    } else {
      await getCurrentLocation();
    }

    var markerId = MarkerId("CURRENT_LOCATION");
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        currentLatitude,
        currentLongitude,
      ),
      infoWindow: InfoWindow(title: "Your Location", snippet: '*'),
      onTap: () {},
    );

    markers[markerId] = marker;

    setState(() {});
  }

  getCurrentLocation() async {
    var location = new Location();
    var currentLocation = await location.getLocation();

    currentLatitude = currentLocation.latitude;
    currentLongitude = currentLocation.longitude;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  double currentLatitude;
  double currentLongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLatitude == null && currentLongitude == null
          ? Container(
              color: Colors.grey[300],
            )
          : GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(currentLatitude, currentLongitude),
                zoom: 20.4746,
              ),
              markers: Set<Marker>.of(markers.values),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
