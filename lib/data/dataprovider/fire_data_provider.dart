import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app_getx/data/models/base_model.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';

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

  FirebaseFirestore? get firestore => _firestore;
}
