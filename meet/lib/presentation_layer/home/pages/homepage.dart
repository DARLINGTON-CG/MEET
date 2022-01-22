import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet/business_logic/app_bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet/presentation_layer/home/widgets/swipe_cards.dart';
import 'package:meet/presentation_layer/settings/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Michigan',
              style: GoogleFonts.lobster(
                  color: const Color(0xFF424B54), fontSize: 20),
            ),
            IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                disabledColor: Colors.grey,
                icon: const Icon(
                  Icons.expand_more_rounded,
                  color: Color(0xFF0D5D56),
                ))
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SettingsPage();
                })),
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Colors.black,
            )),
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.024,
                left: MediaQuery.of(context).size.width * 0.038,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                      color: Colors.blue, shape: BoxShape.circle),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
          height: MediaQuery.of(context).size.height * 0.10,
          color: Colors.yellow,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Center(
              child: Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          ))),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            mini: true,
            key: UniqueKey(),
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.close_rounded,
              color: Colors.yellow,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            key: UniqueKey(),
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            key: UniqueKey(),
            backgroundColor: Colors.black,
            mini: true,
            child: const Icon(
              Icons.redo_rounded,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
