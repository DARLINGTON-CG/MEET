import 'package:auto_route/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meet/presentation_layer/home/widgets/custom_navigation_drawer.dart';
import 'package:meet/presentation_layer/settings/pages/settings_page.dart';

import '../home/pages/homepage.dart';
import '../auth/pages/auth_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: AuthPage, initial: true),
    AutoRoute(page: CustomDrawer, children: [AutoRoute(page: SettingsPage)]),
  ],
)
class $AppRouter {}
