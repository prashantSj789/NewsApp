import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/screens/homescreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen()));});
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
       body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset('assets/13246758_5174551.jpg',fit: BoxFit.cover,width: width*0.9,height: height*0.5,),
            const SizedBox(height: 30,),

           Text("NEWS app powered by NEWS API",style: GoogleFonts.merriweather(color: Colors.black,fontWeight: FontWeight.bold),),
            const SizedBox(height: 50,),
            const SizedBox(
              child: SpinKitFadingCube(color: Colors.blue,size: 50,),
            )
          ],
        ),
       ),
    );
  }
}