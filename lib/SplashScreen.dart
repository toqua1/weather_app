import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 6),
            ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Home())
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:  LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            // Color(0xffEBD771),
            // Colors.yellow ,
            // Color(0xff437bfa),
            // Color(0xff17246A),
            // Color(0xffCDB74C),
            // Color(0xff222D66),
            Color(0xff181146),
             Color(0xff254483),
            // Colors.blue ,
            // Color(0xff9cbcfb),
            Color(0xff85a0da),
          Colors.white70 ,
          ],

        )
      ),
      child: Center(
        child: Lottie.asset('assets/Animation - 1709615126745.json'
            ,fit: BoxFit.cover ,
        height: 350,
        // width:300
        ),
      ),
    );
  }
}
