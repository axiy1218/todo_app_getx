import 'package:get/instance_manager.dart';
import 'package:todo_app_getx/screens/important/important_controller.dart';

class ImportantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportantController>(() => ImportantController());
  }
}
