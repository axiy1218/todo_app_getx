import 'package:get/get.dart';
import 'package:todo_app_getx/screens/complated/complated_controller.dart';

class ComplatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComplatedController>(() => ComplatedController());
  }
}
