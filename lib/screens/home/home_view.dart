import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/screens/home/home_controller.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                await Get.find<AuthDataProvider>().auth.signOut();
                Get.toNamed(AppRouteNames.signUp.routeName);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.theater_comedy_sharp),
        onPressed: () {
          context.changeTheme;
        },
      ),
    );
  }
}

extension on BuildContext {
  get light {
    AdaptiveTheme.of(this).setLight();
  }

  get dark {
    AdaptiveTheme.of(this).setDark();
  }

  ThemeData get theme {
    return AdaptiveTheme.of(this).theme;
  }

  get changeTheme {
    if (AdaptiveTheme.of(this).mode == AdaptiveThemeMode.dark) {
      light;
    } else {
      dark;
    }
  }
}
