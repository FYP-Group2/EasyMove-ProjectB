import 'dart:convert';
import 'package:easymove_merchant/models/merchant.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

const String url = "http://awcgroup.com.my/easymovenpick.com/api";
const String merchantUrl = "http://awcgroup.com.my/merchant_store/api";

class MyApiService {
  static Merchant merchant = Merchant();

  static Future<Map<String, dynamic>> merchantLogIn(String username, String password) async {
    Map<String, String> body = {
      "username" : username,
      "password" : password
    };
    const String apiEndpoint = "$url/merchant_login.php";
    final response = await http.post(
        Uri.parse(apiEndpoint),
        body: body
    );
    final data = json.decode(response.body);
    return data["auth_user"];
  }

  static Future<List<dynamic>> getVehicles() async {
    Map<String, int> vehicleMap = {};
    List<String> vehicleList = [];
    String apiEndpoint = "$url/vehicle_types.php";
    final response = await http.post(Uri.parse(apiEndpoint));
    final data = json.decode(response.body);

    List elements = data["options"];
    for (var e in elements) {
      Map<String, int> vehicle = {e["label"]: e["value"]};
      vehicleMap.addAll(vehicle);
      vehicleList.add(e["label"]);
    }

    List vehicles = [vehicleMap, vehicleList];
    return vehicles;
  }

  static Future<List<dynamic>> getZones() async {
    String apiEndpoint = "$url/zone_details.php";
    final response = await http.post(Uri.parse(apiEndpoint));
    final data = json.decode(response.body);
    return data["zone"];
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

  // id, maincat_id, subcat_id, product_name, price, photo1, status, view, available
  static Future<List<dynamic>> getProducts() async {
    String apiEndpoint = "$merchantUrl/menu_details.php";
    final response = await Dio().post(apiEndpoint);
    Map<String, dynamic> data = json.decode(response.toString());
    return data["product"];
  }

  // maincat_id, maincat_name, position
  static Future<List<dynamic>> getMaincat() async {
    String apiEndpoint = "$merchantUrl/maincat_details.php";
    final response = await Dio().post(apiEndpoint);
    Map<String, dynamic> data = json.decode(response.toString());
    return data["maincat"];
  }

  // subcat_id, maincat_id, subcat_name, position
  static Future<List<dynamic>> getSubcat() async {
    String apiEndpoint = "$merchantUrl/subcat_details.php";
    final response = await Dio().post(apiEndpoint);
    Map<String, dynamic> data = json.decode(response.toString());
    return data["maincat"];
  }

  static Future<void> placeOrder(String cName, String phone, String origin, String destination,
      String cProperty, String collect, String delivery, int zone, int vehicle, String message) async {
    String apiEndpoint = "$url/place_order.php";
    Map<String, dynamic> body = {};
    body['customer_name'] = cName;
    body['phone'] = phone;
    body['sendfrom'] = origin;
    body['sendto'] = destination;
    body['address'] = cProperty;
    body['time'] = collect;
    body['time_to_delivery'] = delivery;
    body['zone'] = zone;
    body['region'] = merchant.region;
    body['requirement'] = vehicle;
    body['message'] = message;
    body['company'] = merchant.companyId;
    body['branch'] = merchant.branchId;
    body['merchant'] = merchant.id;
    body['sendfrom_coordinate'] = merchant.branchCoordinate;
    body['sendto_coordinate'] = "1.520842874515408,110.35449507023179";
    body['distance'] = 2.8;
    FormData formData = FormData.fromMap(body);
    final response = await Dio().post(apiEndpoint, data: formData);
    final data = json.decode(response.toString());
    print(data);
  }

}
