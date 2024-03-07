import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weatherImage.dart';

Widget WeatherItem (String condition ,String time ,int isDay ,double temp){
  DateTime dateTime = DateTime.parse(time);
  String formattedTime = DateFormat('h:mm a').format(dateTime);
  String weatherImage = getWeatherConditionImage(condition, isDay) ?? 'assets/cloud/35.png';
  return Container(
    width: 105,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors:  isDay==1?[
          Colors.indigo,Colors.yellow
        ]:
        [
          Colors.yellow , Colors.indigo
          ]
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(top: 5),
                    width:double.infinity,
                    height: 65,
                    child: Image.asset(weatherImage),
                ) ,
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(formattedTime,style: TextStyle(
                      color: Colors.grey[200] ,fontWeight: FontWeight.w600,fontSize: 18
                  ),),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("${temp}°C" ,style: TextStyle(
                      color: Colors.white ,fontSize: 22,fontWeight: FontWeight.w800
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
  );
}