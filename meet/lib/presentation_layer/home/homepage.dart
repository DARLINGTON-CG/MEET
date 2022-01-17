import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meet/business_logic/app_bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text('Michael, ID',style:  GoogleFonts.alegreya(color: Colors.black, fontSize: 19,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading:IconButton(onPressed: (){}, icon:const Icon(Icons.api,color: Colors.black,)),
        
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.notifications_outlined,color: Colors.black,),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Center(child: Text('No cards yet',style:  GoogleFonts.alegreya(color: Colors.black, fontSize: 19,fontWeight: FontWeight.bold),),
      ));
  }
}
