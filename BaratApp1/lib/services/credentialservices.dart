import 'dart:convert';

import 'package:barat/Models/user_model.dart';
import 'package:barat/screens/admin.dart';
import 'package:barat/screens/order_confirm_list.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../screens/HomePage.dart';

class CredentialServices {
  static var client = http.Client();

  final box = GetStorage();
  void signUpPost(String userName, String fullName, String userEmail,
      String phoneNumber, String password, int userRoll) async {
    // try {
    //   var response = await http.post(
    //       Uri.parse('https://reqres.in/api/register'),
    //       body: {'email': email, 'password': password});
    //   if (response.statusCode == 200) {
    //     print(response.body.toString());
    //     Get.off(() => const HomePage());
    //     print('account created Succesfully');
    //   } else {
    //     print("Account is not Created");
    //   }
    // } catch (e) {
    //   print(e.toString());
    // }

    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse('http://192.168.20.28:2000/api/user/Register'));
      request.body = json.encode({
        "UserName": userName,
        "FullName": fullName,
        "UserEmail": userEmail,
        "phoneNumber": phoneNumber,
        "password": password,
        "userRoll": userRoll
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        box.write('responseSignUp', response.toString());
        print(await response.stream.bytesToString());
        userRoll == 1
            ? Get.off(() => const HomePage())
            : Get.to(() => const OrderConfirmList());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserModel?> loginPost(String userName, String password) async {
    // try {
    //   var response = await http.post(Uri.parse('https://reqres.in/api/login'),
    //       body: {'email': email, 'password': password});
    //   if (response.statusCode == 200) {
    //     print(response.body.toString());
    //     Get.off(() => const HomePage());
    //     print('account created Succesfully');
    //   } else {
    //     print("Account is not Created");
    //   }
    // } catch (e) {
    //   print(e.toString());
    // }

    try {
      // var headers = {'Content-Type': 'application/json'};
      // var request = http.Request(
      //     'POST', Uri.parse('http://192.168.20.28:2000/api/user/login'));
      // request.body = json.encode({"UserName": userName, "password": password});
      // request.headers.addAll(headers);
      //
      // // http.StreamedResponse response = await request.send();
      // http.StreamedResponse response = await request.send();
      //
      // if (response.statusCode == 200) {
      //   // print(await response.stream.bytesToString());
      //   box.write('responseLogin', response.toString());
      //   print(await response.stream.bytesToString());
      //   Get.off(() => const HomePage());
      // } else {
      //   print(response.reasonPhrase);
      // }

      // -----------------------------------------------------------------------
      var url = 'http://192.168.20.28:2000/api/user/login';
      Map data = {
        "UserName": userName,
        "password": password,
      };
      //encode Map to JSON
      var body = json.encode(data);

      var response = await client.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"}, body: body);

      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        print(jsonString['data']['userRoll']);
        var userRole = await jsonString['data']['userRoll'];
        userRole == 0
            ? Get.off(() => const AdminPage())
            : userRole == 2
                ? Get.off(() => const OrderConfirmList())
                : Get.off(() => const HomePage());

        // var eee = json.decode(jsonString);
        // return UserModel(jsonString);
        // return jsonString;
      } else {
        //show error message
        return null;
      }
      // -----------------------------------------------------------------------
    } catch (e) {
      print(e.toString());
    }
  }
}
