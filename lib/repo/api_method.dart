import 'dart:io';

import 'package:dummmy/model/user_model.dart';
import 'package:http/http.dart' as http;


class ApiMethod{

  Future  getCall(url,end) async{
    final finalUrl = url + end.toString();

    try{
      var response = http.get(Uri.parse(finalUrl)).then((response) => response);
      print(finalUrl);
      return response;
    }
    on SocketException {
      print("Please Connect to Internet");
    } on HttpException {
      print("Get request not found");
    } on FormatException {
      print("Get Format is wrong");
    }

  }
  static var client = http.Client();
  static Future<List<UserModel?>?> fetchUserdata() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      var json = response.body;




    } else {
      return null;
    }
  }
}