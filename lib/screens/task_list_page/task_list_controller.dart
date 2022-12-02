import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';

class TaskListController extends GetxController {
  final arguments = Get.arguments;
  late final TaskBaseModel _taskBase;
  late bool isButton = true;
  final focusNode = FocusNode();
  final TextEditingController taskController = TextEditingController();
  @override
  void onInit() {
    isButton = true;
    _taskBase = TaskBaseModel.fromJson(arguments['task_base']);
    update();
    super.onInit();
  }

  clearText() {
    taskController.clear();
  }

  onButtonHide(bool value) {
    isButton = value;
    update();
  }

  onAddTaskPressed() {
    onButtonHide(false);
    Future.delayed(Duration.zero, () {});
  }

  TaskBaseModel get taskBase => _taskBase;
}
