import 'package:celebi_project/pages/main/bottom_nav_bar/bottom_nav_bar_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Future<void> setupLocator() async {
    locator.registerSingleton<BottomNavBarViewModel>(BottomNavBarViewModel());
  }
}
