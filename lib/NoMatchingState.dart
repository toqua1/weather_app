import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotMatchedCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            height: 800,
            child: Stack(
              children: [
                Lottie.network(
                  "https://lottie.host/7e90dd6f-5957-4345-8eea-eeeefac442ac/A6aBq4bWFe.json",
                  fit: BoxFit.cover
                  , height: 400,
                )
                , Image.asset('assets/onBoarding2.png'),
                Positioned(
                  // bottom: 0,
                  top: 400,
                  left: 40,
                  right: 40,
                  child: Text(
                    "No matching location !!\nTry again !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "cinzel",
                      letterSpacing: 1.5,
                    ),),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}