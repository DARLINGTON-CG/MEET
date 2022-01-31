import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet/business_logic/app_bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/presentation_layer/core_widgets/dialogs/notification_dialog.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final snackBar = SnackBar(
    content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.cancel, color:Colors.red),
              const SizedBox(
                width: 10,
              ),
              Text("An error occured",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lobster(fontSize: 16, color: Colors.white))
            ]),
            
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings page'),
          actions: <Widget>[
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
        ),
        body: Center(
            child: TextButton(
          child: const Text("Click Me"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        )));
  }
}
