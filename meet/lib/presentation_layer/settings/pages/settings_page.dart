import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet/business_logic/app_bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/presentation_layer/core_widgets/dialogs/notification_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
          onPressed: () async {
            try {
              late final AuthCredential credential;
              final googleUser = await GoogleSignIn.standard().signIn();
              final googleAuth = await googleUser!.authentication;
              credential = GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              );
              await FirebaseAuth.instance.currentUser!
                  .reauthenticateWithCredential(credential);

              await FirebaseAuth.instance.currentUser!.delete();
              context.read<AppBloc>().add(AppLogoutRequested());
            } on FirebaseAuthException catch (e) {
              if (e.code == 'requires-recent-login') {
                notificationDialog(
                    context: context,
                    notificationMessage: "Requires a recent login",
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ));
              } else {
                notificationDialog(
                    context: context,
                    notificationMessage: "An error occured",
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ));
              }
            }
          },
        )));
  }
}
