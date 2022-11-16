import 'dart:developer';

import 'package:broadcast_app/controllers/navbar_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class UpperPart extends StatefulWidget {
  const UpperPart({super.key});

  @override
  State<UpperPart> createState() => _UpperPartState();
}

class _UpperPartState extends State<UpperPart> {
  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "android.intent.action.UPPER_OVEN_PAGE",
    ],
  );

  List<String> message = [];
  var controller = Get.put(NavBarController());

  @override
  void initState() {
    super.initState();
    receiver.messages.listen(((event) {
      // showAlert(event.data!['state']);
      log(event.data!['state'].toString());
      message.add(event.data!['state']);
      controller.changeUpper(event.data!['state']);
    }));
    receiver.start();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              itemCount: message.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: ListTile(
                    title: const Text(
                      'State:',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      message[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }))),
    );
  }
}

showAlert(String strMessage) {
  showSimpleNotification(
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          color: Colors.white,
          child: Text(
            strMessage,
            style: const TextStyle(color: Colors.black),
          )),
      duration: const Duration(seconds: 3),
      background: Colors.white);
}