import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';

class ComplatedController extends GetxController {
  final fireStore = Get.find<FireDataProvider>();

  final auth = Get.find<AuthDataProvider>();
  late final Stream<QuerySnapshot<Map<String, dynamic>>> query;

  final box = GetStorage();

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    try {
      query = fireStore.firestore!
          .collection('users')
          .doc(auth.auth.currentUser!.uid)
          .collection(
              '${TaskListEnum.complated.name}_${TaskListEnum.complated.id}')
          .orderBy('publishedDate', descending: true)
          .snapshots();
      update();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() async {
    if (box.read('task_base') != null) {
      await box.remove('task_base');
    }
    super.onClose();
  }
}
