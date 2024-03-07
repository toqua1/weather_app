import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InitialWeatherState extends StatelessWidget {
  const InitialWeatherState({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView(
        children :[
          Container(
            height: 800,
            child: Stack(
              children: [
                Lottie.network("https://lottie.host/7e90dd6f-5957-4345-8eea-eeeefac442ac/A6aBq4bWFe.json" ,
                    fit: BoxFit.cover
                    ,height: 400 ,
                )
               , Image.asset('assets/onBoarding3.png'),
                 Positioned(
                      // bottom: 0,
                      top: 400,
                      left: 80,
                      right: 30,
                      child: Text("Oh, It's raining .\nThanks God I brought my umbrella ." ,style: TextStyle(
                        color: Colors.white ,fontSize: 20 , fontFamily: "cinzel" ,letterSpacing: 1.5,
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
