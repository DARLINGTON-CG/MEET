import 'package:flutter/widgets.dart';
import '/business_logic/app_bloc/app_bloc.dart';
import '../auth/pages/auth_page.dart';
import '../home/widgets/custom_navigation_drawer.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [CustomDrawer.page()];
    // return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [AuthPage.page()];
  }
}
