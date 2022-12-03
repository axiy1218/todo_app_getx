import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';

class TaskListViewController extends GetxController {
  final box = GetStorage();
  final FireDataProvider fireStoreSrc = Get.find<FireDataProvider>();
  late final TaskBaseModel taskBase;

  @override
  void onInit() {
    taskBase = TaskBaseModel.fromJson(box.read('task_base'));
    log(taskBase.toString());
    super.onInit();
  }

  void changeFavourite({required Task task}) async {
    try {
      final isUpdated = await fireStoreSrc.updateTask(
          task: task.copyWith(isFavourite: !task.isFavourite!));
      if (isUpdated) {
        Get.snackbar('${task.task}', 'task successfully updated');
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  void changeComplated({required Task task, required bool isComplated}) async {
    try {
      final isUpdated = await fireStoreSrc.updateTask(
          task: task.copyWith(isCompleted: isComplated));

      final isComplatedSaved = await fireStoreSrc.createTaskComplated(
          task: task.copyWith(isCompleted: isComplated));
      if (isComplatedSaved) {
        log('task Complated-------');
      }
      if (isUpdated) {
        Get.snackbar('${task.task}', 'task successfully updated');
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  void deleteTask({required Task task}) async {
    try {
      final isDeleted = await fireStoreSrc.deleteTask(task: task);
      if (isDeleted) {
        Get.snackbar('${task.task}', 'task successfully deleted');
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }
}
