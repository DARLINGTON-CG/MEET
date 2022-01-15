// import 'package:flutter/material.dart';
// import '../auth/pages/auth_page.dart';
// import '../home/homepage.dart';

// class AppRoutes {
//   Route? onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       // case '/':
//       //   return MaterialPageRoute(builder: (context) => HomePage());
//       case '/':
//         return MaterialPageRoute(builder: (context) => const AuthPage());
//     }
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:meet/business_logic/app_bloc/app_bloc.dart';
import 'package:meet/presentation_layer/auth/pages/auth_page.dart';
import 'package:meet/presentation_layer/home/homepage.dart';


List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [AuthPage.page()];
  }
}
