import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet/presentation_layer/home/widgets/swipe_cards.dart';
import '../widgets/custom_navigation_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  static Page page() => MaterialPage<void>(child: HomePage());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            onPressed: () => CustomDrawer.of(context)?.open(),
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
      // bottomSheet: Container(
      //     height: MediaQuery.of(context).size.height * 0.10,
          
      //     color: Colors.transparent,
      //     margin:
      //         EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      //     child:
      //         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      //       FloatingActionButton(
      //         onPressed: () {
      //           ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      //             content: Text("No internet connection",
      //                 textAlign: TextAlign.center,
      //                 style: GoogleFonts.lobster(
      //                     fontSize: 16, color: Colors.white)),
      //             leading: const Icon(Icons.warning_amber_rounded,
      //                 color: Colors.red),
      //             backgroundColor: Colors.black,
      //             elevation: 11,
      //             actions: <Widget>[
      //               IconButton(
      //                 icon: const Icon(
      //                   Icons.close,
      //                   color: Colors.white,
      //                 ),
      //                 onPressed: () => ScaffoldMessenger.of(context)
      //                     .hideCurrentMaterialBanner(),
      //               )
      //             ],
      //           ));

      //           Future.delayed(const Duration(seconds: 3)).then((_) =>
      //               ScaffoldMessenger.of(context).hideCurrentMaterialBanner());
      //         },
      //         mini: true,
      //         key: UniqueKey(),
      //         elevation: 10,
      //         backgroundColor: Colors.black,
      //         child: const Center(
      //           child: Icon(
      //             Icons.send_rounded,
      //             color: Colors.white,
      //             size: 18,
      //           ),
      //         ),
      //       ),
      //       FloatingActionButton(
      //         onPressed: () {},
      //         mini: true,
      //         key: UniqueKey(),
      //         elevation: 10,
      //         backgroundColor: Colors.red,
      //         child: Center(
      //           child: Text(
      //             'AB',
      //             style: GoogleFonts.lobster(color: Colors.white, fontSize: 13),
      //           ),
      //         ),
      //       ),
      //       FloatingActionButton(
      //         onPressed: () {},
      //         mini: true,
      //         key: UniqueKey(),
      //         elevation: 10,
      //         backgroundColor: Colors.blue,
      //         child: Center(
      //           child: Text(
      //             'DO',
      //             style: GoogleFonts.lobster(color: Colors.white, fontSize: 13),
      //           ),
      //         ),
      //       ),
      //       FloatingActionButton(
      //         onPressed: () {},
      //         mini: true,
      //         key: UniqueKey(),
      //         elevation: 10,
      //         backgroundColor: Colors.orange,
      //         child: Center(
      //           child: Text(
      //             'PE',
      //             style: GoogleFonts.lobster(color: Colors.white, fontSize: 13),
      //           ),
      //         ),
      //       ),
      //       FloatingActionButton(
      //         onPressed: () {},
      //         mini: true,
      //         key: UniqueKey(),
      //         elevation: 10,
      //         backgroundColor: Colors.deepPurpleAccent,
      //         child: Center(
      //           child: Text(
      //             'OO',
      //             style: GoogleFonts.lobster(color: Colors.white, fontSize: 13),
      //           ),
      //         ),
      //       ),
      //     ])),
      body: Center(
        child: SwipeCard(
          swipeUp: true,
          swipeDown: true,
          orientation: AmassOrientation.top,
          totalNum: 6,
          stackNum: 3,
          swipeEdge: 4.0,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          minWidth: MediaQuery.of(context).size.width * 0.7,
          minHeight: MediaQuery.of(context).size.height * 0.7,
          cardBuilder: (context, index) => Container(
            child: Center(child: Text(index.toString())),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlue
            ),
           
          ),
          cardController: CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
