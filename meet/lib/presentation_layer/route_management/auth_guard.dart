import 'package:auto_route/auto_route.dart';
import 'package:meet/business_logic/app_bloc/app_bloc.dart';
import 'package:meet/presentation_layer/auth/pages/auth_page.dart';

import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AppStatus status;

  AuthGuard({required this.status});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    switch (status) {
      case AppStatus.authenticated:
        {
          resolver.next(true);
        }
        break;
      case AppStatus.unauthenticated:
        {
          router.push(const AuthPageRoute());
          resolver.next(true);
        }
        break;
      default:
        {
          throw ("Unresolved Error");
        }
    }
  }
}
