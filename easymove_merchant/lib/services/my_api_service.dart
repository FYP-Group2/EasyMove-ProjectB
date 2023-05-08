import 'dart:convert';
import 'package:easymove_merchant/models/merchant.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:easymove_merchant/models/notification_data.dart';

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

  static Future<Map<String, dynamic>> merchantSignUp(String companyName, String email, String business,
      String mobile, String region, String zone, String address) async {
    Map<String, String> body = {
      "company_name" : companyName,
      "email" : email,
      "business_field" : business,
      "mobile_number" : mobile,
      "region" : region,
      "zone" : zone,
      "address" : address
    };
    const String apiEndpoint = "$url/merchant_register.php";
    final response = await http.post(
        Uri.parse(apiEndpoint),
        body: body
    );
    print(response.body);
    final data = json.decode(response.body);
    return data;
  }

  static Future<List> getRegions() async{
    Map<String, int> regionMap = {};
    List<String> regionList = [];
    String apiEndpoint = "$url/regions.php";

    final response = await http.post(Uri.parse(apiEndpoint));
    final data = json.decode(response.body);

    List elements = data["options"];
    for(var e in elements){
      if(!regionList.contains(e["label"])) {
        Map<String, int> region = {e["label"]: e["value"]};
        regionMap.addAll(region);
        regionList.add(e["label"]);
      }
    }

    List regions = [regionMap, regionList];
    return regions;
  }

  static Future<List<dynamic>> getVehicles() async {
    Map<String, int> vehicleMap = {};
    List<String> vehicleList = [];
    String apiEndpoint = "$url/vehicle_types.php";
    final response = await http.post(Uri.parse(apiEndpoint));
    final data = json.decode(response.body);

    List elements = data["options"];
    for (var e in elements) {
      if(!vehicleList.contains(e["label"])) {
        Map<String, int> vehicle = {e["label"]: e["value"]};
        vehicleMap.addAll(vehicle);
        vehicleList.add(e["label"]);
      }
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

  static Future<List<dynamic>> getOrder(int id) async {
    String apiEndpoint = "$url/merchant_order.php";
    Map<String, dynamic> body = {};
    body["id"] = "$id";
    final response = await http.post(Uri.parse(apiEndpoint), body: body);
    final data = json.decode(response.body);
    return data["orders"]["orders"];
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
      String cProperty, String collect, String delivery, int zone, int vehicle, String message,
      String originCoor, String destCoor, double distance) async {
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
    body['sendfrom_coordinate'] = originCoor;
    body['sendto_coordinate'] = destCoor;
    body['distance'] = distance;
    FormData formData = FormData.fromMap(body);
    final response = await Dio().post(apiEndpoint, data: formData);
    final data = json.decode(response.toString());
    print(data);
  }

  static Future<void> updateToken(int merchantId, String token) async {
    String apiEndpoint = "$url/merchant_firebase_token.php";
    final Map<String, String> body = ({'id': "$merchantId", 'token': token});
    await http.post(
        Uri.parse(apiEndpoint),
        body: body
    );
  }

  static Future<List<Map<String, dynamic>>> fetchNoti(int merchantId, String year, String month) async {
    String apiEndpoint = "$url/notification_statement.php";
    final Map<String, String> body = ({'mid': "$merchantId", 'year': year, 'month': month});
    final response = await http.post(
        Uri.parse(apiEndpoint),
        body: body
    );

    Map<String, dynamic> data = json.decode(response.body);

    if(data["result"] == true) {
      List<Map<String, dynamic>> notifications = data["notifications"];
      return notifications;
    }else{
      return [{"result":false}];
    }

  }

  static Future<void> forgotPassword(String email) async {
    String apiEndpoint = "$url/forgot_password.php";
    final Map<String, String> body = ({'merchant_email': email});
    await http.post(
        Uri.parse(apiEndpoint),
        body: body
    );
  }


}
