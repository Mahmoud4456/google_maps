import 'package:flutter/material.dart';
import 'package:google_map/models/Place_autocomplete_model.dart';
import 'package:google_map/services/google_map_service.dart';
import 'package:google_map/utils/location_service.dart';
import 'package:google_map/widgets/custom_search_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({super.key});

  @override
  State<GoogleMapView> createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
   Set<Marker> markers = {};
  late CameraPosition initialCameraPosition ;
  late GoogleMapController googleMapController ;
  late GoogleMapService googleMapService ;
  late LocationService location ;
  late TextEditingController textEditingController ;
  List<PlaceAutocompleteModel> Listplaces = [];
  @override
  void initState() {
  initialCameraPosition = const CameraPosition(target: LatLng(26.09818188706885, 32.76806129914055), zoom: 8);
   location = LocationService();
   textEditingController = TextEditingController();
   getResult();
    super.initState();
  }


  @override
  void dispose() {
    googleMapController.dispose();
    textEditingController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
         body:  Stack(
           children: [
             GoogleMap(
                   onMapCreated: ((controller){
              googleMapController = controller ;
              updateCurrentLocation();
                   }),
              initialCameraPosition: initialCameraPosition,
             markers: markers ,

             ),
             Positioned(
               top: 16,
               right: 16,
               left: 16,
               child: Column(
                 children: [
                   CustomSearchField(textEditingController: textEditingController),
                   ListView.separated(
                     shrinkWrap: true,
                       itemBuilder: (context , index){
                         return Text( Listplaces[index].description!);
                       },
                       separatorBuilder: (context , index){
                         return Divider();
                       },
                       itemCount: Listplaces.length)
                 ],
               ),
             ),
           ],
         )
      ),
    );
  }
  void updateCurrentLocation()async{
    try{
  var locationData =  await location.getLocation();
 LatLng  currentPosition = LatLng(locationData.latitude!, locationData.longitude!);
  Marker marker = Marker(markerId: const MarkerId("my Marker"), position: currentPosition , );
  CameraPosition myCameraPosition = CameraPosition(target: currentPosition ,zoom: 15);
  googleMapController.animateCamera(CameraUpdate.newCameraPosition(myCameraPosition));
  markers.add(marker);
  setState(() {});
  } on LocationServiceException catch (e) {
      print("-----${e.toString()}-------");
    } on LocationPermissionException catch (e){
      print("-----${e.toString()}++++++++");

    }  catch(e){
      print("-----${e.toString()}////////");
    }
  }
   void getResult() {
     textEditingController.addListener(()async{
       googleMapService = GoogleMapService();
       if (textEditingController.text.isNotEmpty) {
         var result = await googleMapService.getPrediction(
             input: textEditingController.text);
         Listplaces.clear();
         Listplaces.addAll(result);
         setState(() {});
       }
     });
   }
}

