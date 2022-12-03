import 'package:get/route_manager.dart';
import 'package:todo_app_getx/screens/auth/sign_in/sign_in_view.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_binding.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_view.dart';
import 'package:todo_app_getx/screens/complated/complated_binding.dart';
import 'package:todo_app_getx/screens/complated/complated_page.dart';
import 'package:todo_app_getx/screens/home/home_binding.dart';
import 'package:todo_app_getx/screens/home/home_view.dart';
import 'package:todo_app_getx/screens/important/important_binding.dart';
import 'package:todo_app_getx/screens/important/important_view.dart';
import 'package:todo_app_getx/screens/search/search_binding.dart';
import 'package:todo_app_getx/screens/search/search_view.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_binding.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_page.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_view/task_list_view.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_view/task_list_view_binding.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';

class AppRouting {
  static final appPages = [
    GetPage(
        name: AppRouteNames.home.route,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: AppRouteNames.signUp.route,
        page: () => const SignUpView(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRouteNames.signIn.route,
        page: () => const SignInView(),
        binding: SignUpBinding()),
    GetPage(
        name: AppRouteNames.search.route,
        page: () => const SearchView(),
        binding: SearchBinding()),
    GetPage(
        name: AppRouteNames.important.route,
        page: () => const ImportantView(),
        binding: ImportantBinding()),
    GetPage(
        name: AppRouteNames.complated.route,
        page: () => const ComplatedPage(),
        binding: ComplatedBinding()),
    GetPage(
        name: AppRouteNames.taskListPage.route,
        page: () => const TaskListPage(),
        binding: TaskListBinding()),
    GetPage(
        name: AppRouteNames.taskListView.route,
        page: () => const TaskListView(),
        binding: TaskListViewBinding()),
  ];
}

enum TaskListEnum {
  important(name: "important", id: 'task000'),
  complated(name: "tasks", id: 'task111');

  final String name;
  final String id;
  const TaskListEnum({required this.name, required this.id});
}
