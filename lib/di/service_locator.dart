import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/repositories/auth_data_repository.dart';

class GetSrcLocator {
  static Future<void> initServices() async {
    Get.lazyPut<AuthDataProvider>(() => AuthDataProvider());

    Get.lazyPut<AuthDataRepository>(() => AuthDataRepository());
  }
}
