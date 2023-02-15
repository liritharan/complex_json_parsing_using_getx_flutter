import 'dart:convert';

import 'package:dummmy/model/user_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var isLoading = false.obs;
  UserModel? userModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(
          'https://rss.applemarketingtools.com/api/v2/in/apps/top-paid/50/apps.json'));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);

        userModel = UserModel.fromJson(result);
        print(userModel!.feed!.results.length);
        update();
        print(userModel!.feed!.results);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
