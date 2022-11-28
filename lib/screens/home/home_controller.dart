import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:uuid/uuid.dart';

abstract class HomeRepository {
  Future<void> createTaskList();
  void showCustomDiolog(BuildContext context);
}

class HomeController extends GetxController implements HomeRepository {
  final FireDataProvider fireDataProvider = Get.find<FireDataProvider>();
  final AuthDataProvider auth = Get.find<AuthDataProvider>();
  final TextEditingController taskListController = TextEditingController();
  void changeTheme() {
    update();
  }

  @override
  Future<void> createTaskList() async {
    try {
      assert(taskListController.text.isNotEmpty);
      final taskListId = const Uuid().v1();
      final listSaved = await fireDataProvider.createTaskCollection(
          uid: auth.auth.currentUser!.uid,
          taskBase: TaskBaseModel(
              userId: auth.auth.currentUser!.uid,
              id: taskListId,
              name: taskListController.text,
              publishDate: DateTime.now()));

      if (listSaved) {
        Get.snackbar('new list', 'Task list created');
        update();
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void showCustomDiolog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            buttonPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: .0),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.w)),
            title: const Text('New list'),
            content: TextField(
              controller: taskListController,
              decoration: InputDecoration(
                  hintText: 'Enter list title',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 16.sp),
                  filled: true,
                  fillColor: const Color(0xFFFAF9FB),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 2.h, color: const Color(0xFFA9A8AA)))),
            ),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                      onPressed: Get.back,
                      child: Text(
                        'cancel',
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                  ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.w))),
                      onPressed: () {
                        createTaskList();
                        Get.back();
                      },
                      label: Text(
                        'Add',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      )),
                ],
              )
            ],
          );
        });
  }
}
