import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meet/business_logic/connectivity_bloc/connectivity_cubit.dart';
import 'package:meet/data_layer/repositories/auth_repository.dart';
import 'package:meet/presentation_layer/theme/application_theme.dart';
import 'package:flow_builder/flow_builder.dart';


import 'business_logic/app_bloc/app_bloc.dart';
import 'business_logic/app_bloc/app_bloc_observer.dart';
import 'presentation_layer/route_management/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  await Firebase.initializeApp();
  final authRepository = AuthRepository();
  await authRepository.user.first;

  BlocOverrides.runZoned(
    () => runApp(App(
        // applicationRoutes: AppRoutes(),
        // connectivity: InternetConnectionChecker(),
        authRepository: authRepository)),
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  final AuthRepository _authRepository;

  const App({Key? key, required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
          create: (_) => AppBloc(authenticationRepository: _authRepository),
          child:const  AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         title: 'Meet',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
       
    );
  }
}

// class App extends StatelessWidget {
//   final AppRoutes applicationRoutes;
//   final ThemeClass theme = ThemeClass(ThemeValue.dark);
//   final InternetConnectionChecker connectivity;

//   App({Key? key, required this.applicationRoutes, required this.connectivity})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<InternetCubit>(
//             create: (context) =>
//                 InternetCubit(internetConnection: connectivity))
//       ],
//       child: MaterialApp(
//         title: 'Meet',
//         theme: theme.darkTheme(),
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: applicationRoutes.onGenerateRoute,
//       ),
//     );
//   }
// }
