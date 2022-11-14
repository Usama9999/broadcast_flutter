import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:overlay_support/overlay_support.dart';

class BroadcastReciver extends StatefulWidget {
  const BroadcastReciver({super.key});

  @override
  State<BroadcastReciver> createState() => _BroadcastReciverState();
}

class _BroadcastReciverState extends State<BroadcastReciver> {
  BroadcastReceiver receiver = BroadcastReceiver(
    names: <String>[
      "de.kevlatus.flutter_broadcasts_example.demo_action",
    ],
  );

  List<String> message = [];

  @override
  void initState() {
    super.initState();
    receiver.messages.listen(((event) {
      showAlert(event.data!['key']);
      log(event.data!['key'].toString());
      message.add(event.data!['key']);
      // setState(() {

      // });
    }));
    receiver.start();
  }

  @override
  void dispose() {
    // receiver.stop();
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
                      'Message:',
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
