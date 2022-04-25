import 'dart:convert';

import 'package:barat/Models/get_halls_by_i_d.dart';
import 'package:barat/Models/hall_owner_model.dart';
import 'package:barat/Models/location_model.dart';
import 'package:barat/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class LocationServices {
  Future<LocationModel> fetchLocationArea() async {
    final response = await http.get(Uri.parse(AppUrl.locationGetAreas));
    print(response);
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      print(data['data'][0]['areaName']);
      return LocationModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  void postLocationByAdmin(var imageUrl, String areaName) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(AppUrl.createArea));
    request.body = json.encode({"areaName": areaName, "areaImage": imageUrl});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> postHallsByAdmin(
      List listImages,
      String areaId,
      String hallOwnerId,
      String OwnerName,
      String hallName,
      int OwnerContact,
      String OwnerEmail,
      String HallAddress,
      int HallCapacity,
      int PricePerHead,
      int CateringPerHead,
      bool EventPlanner) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.20.28:2000/api/halls/createHalls'));
    request.body = json.encode({
      "images": listImages,
      "areaId": areaId,
      "hallOwnerId": hallOwnerId,
      "OwnerName": OwnerName,
      "hallName": hallName,
      "OwnerContact": OwnerContact,
      "OwnerEmail": OwnerEmail,
      "HallAddress": HallAddress,
      "HallCapacity": HallCapacity,
      "PricePerHead": PricePerHead,
      "CateringPerHead": CateringPerHead,
      "EventPlanner": EventPlanner,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<GetHallsByID> getHallApiById(var id) async {
    final response = await http
        .get(Uri.parse('http://192.168.20.28:2000/api/getHalls/${id}'));
    // final response = await http.get(Uri.parse('${AppUrl.getHallsById.id}'));
    print('79  GetHallByID ${response.body}');
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      return GetHallsByID.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<void> postbookHallsByUser(
      String userId,
      String date,
      String time,
      int guestsQuantity,
      bool eventPlaner,
      bool cateringServices,
      int totalPayment,
      String hallOwnerId) async {
    print("76 ${userId}");

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(AppUrl.postbookHallsByUser));
    request.body = json.encode({
      "userId": userId,
      "Date": date,
      "Time": time,
      "GuestsQuantity": guestsQuantity,
      "EventPlaner": eventPlaner,
      "CateringServices": cateringServices,
      "TotalPaynment": totalPayment,
      "hallOwnerId": hallOwnerId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<HallOwnerModel> getHallOwner() async {
    final response = await http.get(Uri.parse(AppUrl.GetHallOwner));
    if (response.statusCode == 200) {
      print(response);
      var data = await jsonDecode(response.body);
      return HallOwnerModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
