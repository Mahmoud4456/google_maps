import 'package:location/location.dart';

class LocationService{
 late Location location ;

  Future<bool> checkAndRequestLocationService() async {
    var isServiceEnable = await location.serviceEnabled();
    if(!isServiceEnable){
      isServiceEnable = await location.requestService();
      if(!isServiceEnable){
        return false ;
      }
    }
    return true ;
  }

 Future<bool> checkAndRequestLocationPermission() async {
   var permissionStatus = await location.hasPermission();
   if(permissionStatus == PermissionStatus.deniedForever){
     return false ;
   }
   if(permissionStatus == PermissionStatus.denied){
     permissionStatus = await location.requestPermission();
     return permissionStatus == PermissionStatus.granted ;
   }
   return true ;
 }

 void getRealLocation(void Function(LocationData)? onData){
    location.onLocationChanged.listen(onData);

 }

}