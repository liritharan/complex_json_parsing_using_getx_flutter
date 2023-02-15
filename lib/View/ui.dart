import 'package:dummmy/controller/controller.dart';
import 'package:dummmy/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userdata = Get.put(UserController());
  @override
  void initState()  {
    userdata.fetchData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Complex JSON Parsing'),
        ),
        body: Obx(() {
          return userdata.isLoading.value ? const CircularProgressIndicator() :
          Column(
            children: [

              Expanded(child: ListView.builder(
                  itemCount: userdata.userModel!.feed.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const CircleAvatar(
                          child: Icon(
                            Icons.account_circle_outlined, color: Colors.amber,
                            size: 35,),
                        ),
                        title: InkWell(
                          onTap: () {

                          },

                          child:    Text(userdata.userModel!.feed.results[index].name.toString()),)
                    );
                  }),),
            ],
          );
        })

    );
  }
}

