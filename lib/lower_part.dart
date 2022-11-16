import 'package:broadcast_app/controllers/navbar_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class LowerPart extends StatefulWidget {
  const LowerPart({super.key});

  @override
  State<LowerPart> createState() => _LowerPartState();
}

class _LowerPartState extends State<LowerPart> {
  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "android.intent.action.LOWER_OVEN_PAGE",
    ],
  );

  List<String> message = [];
  var controller = Get.put(NavBarController());

  @override
  void initState() {
    super.initState();
    receiver.messages.listen(((event) {
      // showAlert(event.data!['state']);
      showAlert(event.data.toString());
      message.add(event.data.toString());
      setState(() {});
      if (event.data!.containsKey('state')) {
        controller.changeLower(event.data!['state']);
      }
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
                      'Data:',
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
