import 'package:get/instance_manager.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_controller.dart';

class TaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskListController>(() => TaskListController());
  }
}
