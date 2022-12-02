import 'package:get/route_manager.dart';
import 'package:todo_app_getx/screens/auth/sign_in/sign_in_view.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_binding.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_view.dart';
import 'package:todo_app_getx/screens/complated/complated_binding.dart';
import 'package:todo_app_getx/screens/complated/complated_view.dart';
import 'package:todo_app_getx/screens/home/home_binding.dart';
import 'package:todo_app_getx/screens/home/home_view.dart';
import 'package:todo_app_getx/screens/important/important_binding.dart';
import 'package:todo_app_getx/screens/important/important_view.dart';
import 'package:todo_app_getx/screens/search/search_binding.dart';
import 'package:todo_app_getx/screens/search/search_view.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_binding.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_page.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';

class AppRouting {
  static final appPages = [
    GetPage(
        name: AppRouteNames.home.routeName,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: AppRouteNames.signUp.routeName,
        page: () => const SignUpView(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRouteNames.signIn.routeName,
        page: () => const SignInView(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRouteNames.search.routeName,
        page: () => const SearchView(),
        binding: SearchBinding()),
    GetPage(
        name: AppRouteNames.important.routeName,
        page: () => const ImportantView(),
        binding: ImportantBinding()),
    GetPage(
        name: AppRouteNames.complated.routeName,
        page: () => const ComplatedView(),
        binding: ComplatedBinding()),
    GetPage(
        name: AppRouteNames.taskListPage.routeName,
        page: () => const TaskListPage(),
        binding: TaskListBinding()),
  ];
}
