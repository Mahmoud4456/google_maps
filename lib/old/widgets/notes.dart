import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../model/flutter_map_model.dart';

class FlutterMapViewTest extends StatefulWidget {
  const FlutterMapViewTest({super.key});

  @override
  State<FlutterMapViewTest> createState() => _FlutterMapViewTest();
}

class _FlutterMapViewTest extends State<FlutterMapViewTest> {
  late LatLng initialCenter;
  List<Marker> markers = [];
  List<Polyline> polyLine = [] ;
  List<Polygon> polygons = [];
  List<CircleMarker> circles = [];
  //String MapType = "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}";
  MapController flutterMapController = MapController();
  @override
  void initState() {
    initialCenter = const LatLng(26.16718230960255, 32.72295348796703);
    setMarker();
    setPolyLine();
    setPolygons();
    setCircle();
    super.initState();
  }

  @override
  void dispose() {
    flutterMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FlutterMap(
        mapController: flutterMapController,
        options: MapOptions(
          // cameraConstraint: CameraConstraint.containCenter(
          //   bounds: LatLngBounds(
          //     const LatLng(25.999159964975323, 32.65284298754094),
          //     const LatLng(26.3133636161193, 32.802791438245364),
          //   ),
          // ),
          initialCenter: initialCenter,
          initialZoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(markers: markers),
          PolylineLayer(polylines: polyLine, ),
          PolygonLayer(polygons:polygons,),
          CircleLayer(circles: circles)

          // RichAttributionWidget(
          //   attributions: [
          //     TextSourceAttribution(
          //       'OpenStreetMap contributors',
          //       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
          //     ),
          //     // Also add images...
          //   ],
          // ),
        ],
      ),
      Positioned(
        bottom: 15,
        left: 10,
        right: 10,
        child: ElevatedButton(
          onPressed: () {
            flutterMapController.move(
                const LatLng(26.17742741911928, 32.74735425188808), 13);
          },
          child: const Text("Change "),
        ),
      ),
    ]);
  }
  Future <Uint8List> getImageRowInfo( String image , double size ) async{
    var imageData = await rootBundle.load(image);
    var imageCodec = await  ui.instantiateImageCodec(
        imageData.buffer.asUint8List(),
        targetWidth: size.round() );
    var imageFramInfo = await imageCodec.getNextFrame();
    var imageByteData =  await imageFramInfo.image.toByteData(format: ui.ImageByteFormat.png );
    return imageByteData!.buffer.asUint8List();
  }
  void setMarker() async {
    var myMarkers = places
        .map(
          (place) => Marker(
        point: place.location,
        child: Icon(place.icon),
      ),
    )
        .toList();
    markers.addAll(myMarkers);
  }

  void setPolyLine() {
    Polyline polyline = Polyline(points: const [
      LatLng(26.09288973457702, 32.77674680723566),
      LatLng(26.159814672864, 32.718726599618904),
      LatLng(26.189245063628643, 32.7421319291628),
      LatLng(26.179955095881407, 32.754541897902826),

    ],
        color: Colors.blue, strokeWidth: 3, strokeCap: StrokeCap.round);
    polyLine.add(polyline);
  }

  void setPolygons() {
    Polygon polygon = Polygon(points: const[
      LatLng(26.15323563148376, 32.70627104659901),
      LatLng(26.137671866176973, 32.74274908666474),
      LatLng(26.16872028810007, 32.739573351411956),
    ],
      holePointsList:[const [
        LatLng(26.153778259783103, 32.72251708170324),
        LatLng(26.14835153825921, 32.73271117345663),
        LatLng(26.157277425724544, 32.72968838558879),
      ]] ,
      color: Colors.amber.withValues(alpha: .5),
    );
    polygons.add(polygon);
  }

  void setCircle() {
    CircleMarker circleMarker = CircleMarker(
      point: const LatLng(26.168728507760143, 32.706840276993006),
      radius:100,
      borderColor: Colors.black,
      borderStrokeWidth: 1,
      color: Colors.grey.withValues(alpha: .2),
    );
    circles.add(circleMarker);
  }
}
