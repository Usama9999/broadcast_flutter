import 'package:get/get.dart';

class NavBarController extends GetxController {
  String upper = 'Upper';
  String lower = 'Lower';

  changeUpper(val) {
    upper = val;
    update();
  }

  changeLower(val) {
    lower = val;
    update();
  }
}
