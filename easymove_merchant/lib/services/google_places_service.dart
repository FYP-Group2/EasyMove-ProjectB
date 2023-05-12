import 'dart:convert';
import 'package:http/http.dart';
import 'package:easymove_merchant/models/suggestion.dart';

class PlaceApiProvider {
  final client = Client();
  List<Suggestion> allSuggestions = [];

  final String apiKey = "AIzaSyC7kd8gzxzXNDVlNENHD7jWZskJjAFSs-E";
  late String sessionToken;

  void refreshToken(String token){
    sessionToken = token;
  }

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&location=1.5271226201317538%2C110.36956691323822&radius=50000&language=$lang&components=country:my&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        List<Suggestion> suggestions = result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();

        for(var s in suggestions){
          if(!allSuggestions.contains(s)){
            allSuggestions.add(s);
          }
        }

        return suggestions;
      }

      return [];
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>> getCoordinates(String placeId) async{
    final request =
        "https://maps.googleapis.com/maps/api/place/details/json?&place_id=$placeId&key=$apiKey&sessiontoken=$sessionToken";
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("-----GET COORDINATE-----\n${result["result"]["geometry"]["location"]}");
      return result["result"]["geometry"]["location"];
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<double> getDistance(String destId, String originId) async{
    String request = "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=place_id:$destId&origins=place_id:$originId&units=imperial&key=$apiKey";
    final response = await client.get(Uri.parse(request));
    final result = json.decode(response.body);

    if(result["status"] == "OK"){
      double distance = double.parse( ((result["rows"][0]["elements"][0]["distance"]["value"] as int).toDouble()/1000).toStringAsFixed(2) );
      print(distance);
      return distance;
    }

    return 0.0;
  }

  String findPlaceIdByDesc(String desc){
    String placeId = "";

    for(var s in allSuggestions){
      if(desc == s.description){
        placeId = s.placeId;
      }
    }

    return placeId;
  }

}