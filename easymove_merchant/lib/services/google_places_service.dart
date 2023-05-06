import 'dart:convert';
import 'package:http/http.dart';
import 'package:easymove_merchant/models/suggestion.dart';
import 'package:flutter/material.dart';

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionToken);

  final String apiKey = "AIzaSyC7kd8gzxzXNDVlNENHD7jWZskJjAFSs-E";
  final sessionToken;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&location=1.5271226201317538%2C110.36956691323822&radius=50000&language=$lang&components=country:my&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        print("Zero Result-----$result");
        return [];
      }
      return [];
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<void> getCoordinates(String placeId) async{
    final request =
        "https://maps.googleapis.com/maps/api/place/details/json?&place_id=$placeId&key=$apiKey&sessiontoken=$sessionToken";
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      print("-----GET COORDINATE-----\n${result["result"]["geometry"]["location"]}");
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

}