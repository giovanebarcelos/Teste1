import 'package:flutter/material.dart';
import 'package:giovane_s_application4/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:giovane_s_application4/presentation/home_container_screen/home_container_screen.dart';
import 'package:giovane_s_application4/presentation/detail_item_screen/detail_item_screen.dart';
import 'package:giovane_s_application4/presentation/order_tab_container_screen/order_tab_container_screen.dart';
import 'package:giovane_s_application4/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String homePage = '/home_page';

  static const String homeTabContainerPage = '/home_tab_container_page';

  static const String homeContainerScreen = '/home_container_screen';

  static const String detailItemScreen = '/detail_item_screen';

  static const String orderPage = '/order_page';

  static const String orderTabContainerScreen = '/order_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        onboardingScreen: OnboardingScreen.builder,
        homeContainerScreen: HomeContainerScreen.builder,
        detailItemScreen: DetailItemScreen.builder,
        orderTabContainerScreen: OrderTabContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: OnboardingScreen.builder
      };
}
