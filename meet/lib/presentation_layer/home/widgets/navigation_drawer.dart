import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
                child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('Michael Langdon',
                    style: GoogleFonts.lobster(
                      fontSize: 18,
                      color: Colors.blueGrey,
                      //fontWeight: FontWeight.bold,
                    )),
              ],
            )),
          ),
          ListTile(
              title: Text(
                'PROFILE',
                style: GoogleFonts.alegreya(
                  fontSize: 14,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.data_usage_sharp,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: Text(
                'SETTINGS',
                style: GoogleFonts.alegreya(
                  fontSize: 14,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const Icon(
                Icons.build_circle_rounded,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: Text(
                'PURCHASES',
                style: GoogleFonts.alegreya(
                    fontSize: 14,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              title: Text(
                'LIKES',
                style: GoogleFonts.alegreya(
                    fontSize: 14,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
               ListTile(
              title: Text(
                'HELP CENTER',
                style: GoogleFonts.alegreya(
                    fontSize: 14,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.help_rounded,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
