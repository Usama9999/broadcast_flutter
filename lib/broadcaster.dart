import 'package:broadcast_app/widgets/custom_text_fields.dart';
import 'package:broadcast_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';

class BroadCaster extends StatefulWidget {
  const BroadCaster({super.key});

  @override
  State<BroadCaster> createState() => _BroadCasterState();
}

class _BroadCasterState extends State<BroadCaster> {
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  sendBroadCast() {
    sendBroadcast(
      BroadcastMessage(
          name: "de.kevlatus.flutter_broadcasts_example.demo_action",
          data: {'key': valueController.text}),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // Expanded(
                //     flex: 3,
                //     child: customTextFiledSimple(keyController, hint: 'Key')),
                // const SizedBox(
                //   width: 5,
                // ),
                Expanded(
                    flex: 5,
                    child:
                        customTextFiledSimple(valueController, hint: 'Message'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
                label: 'Send Broadcast',
                onPress: () {
                  if (valueController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Fill all fields')));
                  } else {
                    sendBroadCast();
                  }
                })
          ],
        ),
      ),
    );
  }
}
