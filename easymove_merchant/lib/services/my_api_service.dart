import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApiService{

  static Future<List> getVehicles() async{
    Map<String, int> vehicleMap = {};
    List<String> vehicleList = [];
    const String url = "https://easysuperapps.com//easysuperapps.com/api/vehicle_types.php/vehicle_types.php";
    final response = await http.post(Uri.http(url));
    final data = json.decode(response.toString());

    List elements = data["options"];
    for(var e in elements){
      Map<String, int> vehicle = {e["label"] : e["value"]};
      vehicleMap.addAll(vehicle);
      vehicleList.add(e["label"]);
    }

    List vehicles = [vehicleMap, vehicleList];
    return vehicles;
  }

}