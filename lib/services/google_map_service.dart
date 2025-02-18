import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:google_map/models/Place_autocomplete_model.dart';

class GoogleMapService {
 String baseUrl = "https://maps.googleapis.com/maps/api/place";
 String apiKey = "AIzaSyATQST7P3F22EopGBW21Rf2mwB_QDmxjcQ";

 Future<List<PlaceAutocompleteModel>> getPrediction({required String input }) async {
 var response = await http.get(Uri.parse("$baseUrl/autocomplete/json?input=$input&key=$apiKey"));
 if(response.statusCode == 200){
  var data = jsonDecode(response.body )["predictions"];
  List<PlaceAutocompleteModel> places =[];
  for(var item in data){
  places.add(PlaceAutocompleteModel.fromJson(item));
  }
  return places ;
 }else{
   throw Exception();
 }
  }
}