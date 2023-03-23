import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

const String url = "http://awcgroup.com.my/easymovenpick.com/api";

class MyApiService {

  static Future<List> getVehicles() async {
    Map<String, int> vehicleMap = {};
    List<String> vehicleList = [];
    String apiEndpoint = "/vehicles_type.php";
    final response = await http.post(Uri.http(url, apiEndpoint));
    final data = json.decode(response.toString());

    List elements = data["options"];
    for (var e in elements) {
      Map<String, int> vehicle = {e["label"]: e["value"]};
      vehicleMap.addAll(vehicle);
      vehicleList.add(e["label"]);
    }

    List vehicles = [vehicleMap, vehicleList];
    return vehicles;
  }

  static Future<dynamic> getTrip() async {
    String apiEndpoint = "$url/trip_statement.php";
    Map<String, int> body = {};
    body["branch"] = 24;
    FormData formData = FormData.fromMap(body);
    final response = await Dio().post(apiEndpoint, data: formData);
    final data = json.decode(response.toString());
    return data;
  }

}
