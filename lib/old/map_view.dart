import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'services/location_service.dart';

class FlutterMapViewLocation extends StatefulWidget {
  const FlutterMapViewLocation({super.key});

  @override
  State<FlutterMapViewLocation> createState() => _FlutterMapViewLocationState();
}

class _FlutterMapViewLocationState extends State<FlutterMapViewLocation> {

  late LatLng initialCenter ;
  late LocationService locationService ;
  late MapController controller ;
  List<Marker> markers = [] ;
  @override
  void initState() {
    controller = MapController();
    locationService = LocationService();
    initialCenter = const LatLng(26.16718230960255, 32.72295348796703);
    upDateLocation();
    super.initState();

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller ,
        options: MapOptions(
          initialCenter: initialCenter,
          initialZoom: 13,
        ),
        children: [
          TileLayer(urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: markers),
        ]
    );
  }


  void upDateLocation () async{
    await locationService.checkAndRequestLocationService();
    var hasPermission = await locationService.checkAndRequestLocationPermission();
    if( hasPermission ) {
      locationService.getRealLocation((currentLocation) {
        locationService.location.changeSettings(
          distanceFilter: 2,
        );
        controller.move(LatLng(currentLocation.latitude!, currentLocation.longitude!), 14);
        Marker marker = Marker(point: LatLng(currentLocation.latitude!, currentLocation.longitude!),
            child: const Icon(Icons.location_pin)
        );
        markers.add(marker);
        setState(() { });

      });
    }else{
      const AlertDialog();
    }
  }
}
