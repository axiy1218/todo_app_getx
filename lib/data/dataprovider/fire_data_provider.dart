import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app_getx/data/models/base_model.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';

class FireDataProvider extends GetxService {
  late final FirebaseFirestore? _firestore;
  FireDataProvider() {
    _firestore = FirebaseFirestore.instance;
    log('Firestore INITEDDD');
  }

  Future<bool> createDataCollection<T extends BaseModel>(
      {required T? data,
      required String? collectionName,
      required String? id}) async {
    try {
      assert(data != null);
      await _firestore!.collection(collectionName!).doc(id).set(data!.toJson());
      return true;
    } on FirebaseException catch (e, s) {
      log('Firebase Exception Provider');
      log(s.toString());
    }

    return false;
  }

  Future<bool> createTaskCollection({
    required String uid,
    required TaskBaseModel taskBase,
  }) async {
    try {
      await _firestore!.collection('users').doc(uid).update({
        'taskLists': FieldValue.arrayUnion([taskBase.toJson()])
      });

      return true;
    } on FirebaseException {
      log('FIREBASE EXCEPTION');
    }
    return false;
  }

  Future<bool> createTask({required Task task}) async {
    try {
      _firestore!
          .collection('users')
          .doc(task.userId)
          .collection('${task.taskListName}_${task.taskListId}')
          .doc(task.id)
          .set(task.toJson());
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> createTaskComplated({required Task task}) async {
    try {
      _firestore!
          .collection('users')
          .doc(task.userId)
          .collection(
              '${TaskListEnum.complated.name}_${TaskListEnum.complated.id}')
          .doc(task.id)
          .set(task.toJson());
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> updateTask({required Task task}) async {
    try {
      _firestore!
          .collection('users')
          .doc(task.userId)
          .collection('${task.taskListName}_${task.taskListId}')
          .doc(task.id)
          .update(task.toJson());
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> deleteTask({required Task task}) async {
    try {
      _firestore!
          .collection('users')
          .doc(task.userId)
          .collection('${task.taskListName}_${task.taskListId}')
          .doc(task.id)
          .delete();
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  FirebaseFirestore? get firestore => _firestore;
}
