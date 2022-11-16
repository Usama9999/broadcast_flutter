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

  String groupValue = 'upper';

  sendUpper() {
    sendBroadcast(
      BroadcastMessage(
          name: "android.intent.action.UPPER_OVEN_PAGE",
          data: {'state': valueController.text}),
    );
  }

  sendLower() {
    sendBroadcast(
      BroadcastMessage(
          name: "android.intent.action.LOWER_OVEN_PAGE",
          data: {'state': valueController.text}),
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
                Expanded(
                    flex: 5,
                    child:
                        customTextFiledSimple(valueController, hint: 'State'))
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
                    if (groupValue == 'upper') {
                      sendUpper();
                    } else {
                      sendLower();
                    }
                  }
                }),
            Row(
              children: [
                Row(
                  children: [
                    Radio(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        value: 'upper',
                        groupValue: groupValue,
                        onChanged: (val) {
                          groupValue = val!;
                          setState(() {});
                        }),
                    const Text(
                      'Upper',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        fillColor: MaterialStateProperty.all(Colors.white),
                        value: 'lower',
                        groupValue: groupValue,
                        onChanged: (val) {
                          groupValue = val!;
                          setState(() {});
                        }),
                    const Text(
                      'Lower',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
