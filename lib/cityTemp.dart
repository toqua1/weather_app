import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/detailesWeather.dart';
import 'package:weather_app/weatherItem.dart';
import 'package:weather_app/weatherImage.dart' ;
import 'package:page_transition/page_transition.dart';

class CityTemp extends StatefulWidget {
  const CityTemp({super.key});

  @override
  State<CityTemp> createState() => _CityTempState();
}

class _CityTempState extends State<CityTemp> {
  @override
  Widget build(BuildContext context) {
    var weatherModel=BlocProvider.of<GetWeatherCubit>(context ).weatherModel ;
    return Expanded(
      child: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.location_on ,color: Colors.yellow,size: 25,),
                ) ,
                Text(" ${weatherModel.cityName},",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w800,fontSize: 23, fontFamily: "Cinzel"
                ),) ,
                Text(" ${weatherModel.country}" ,style: TextStyle(
                    color: Colors.grey ,fontSize: 20,fontWeight: FontWeight.w500 ,fontFamily: "Cinzel" ,letterSpacing: 1.5
                ),),
              ],
            ),
          ),
          Row(
            children: [
              Spacer(),
              Text("  ${weatherModel.date.substring(0,11)}",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w800,fontSize: 18 ,fontFamily: "Cinzel"
              ),),
              Text("  ${weatherModel.date.substring(11)}    ",style: TextStyle(
                  color: Colors.grey,fontWeight: FontWeight.w800,fontSize: 18 ,fontFamily: "Cinzel"
              ),),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 230,
            child: Image.asset(getWeatherConditionImage(weatherModel.weatherCondition ,weatherModel.isDay)),
          ),
          Center(
            child: Text("${weatherModel.temp}°C", style: TextStyle(
                fontWeight: FontWeight.w800 ,fontSize:35 ,color: Colors.white,fontFamily: "Cinzel",letterSpacing: 3
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: Text(weatherModel.weatherCondition, style: TextStyle(
                  fontWeight: FontWeight.w400 ,fontSize:20 ,color: Colors.grey,fontFamily: "Cinzel" ,letterSpacing: 3
              ),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WeatherItem(weatherModel.condition1,weatherModel.time1,weatherModel.isDay1,weatherModel.temp1) ,
              WeatherItem(weatherModel.condition2,weatherModel.time2,weatherModel.isDay2 ,weatherModel.temp2) ,
              WeatherItem(weatherModel.condition3,weatherModel.time3,weatherModel.isDay3,weatherModel.temp3),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0 ,vertical: 20),
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          foregroundColor: Color(0xff181146),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,PageTransition(child:DetailedWeather(weatherModel: weatherModel,), type: PageTransitionType.rotate,alignment: Alignment.topLeft ,duration: Duration(milliseconds: 500) ,reverseDuration: Duration(milliseconds: 500)),
                          );
                        },
                        child: Text("show 5-day forecast", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, fontFamily: "Cinzel")),
                      ),
                    ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5 ,left: 10),
                    width: 180,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2) ,
                      borderRadius: BorderRadius.circular(16) ,
                    ),
                    child:Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.sunny ,size: 20,color: Colors.orange,shadows: [Shadow(color: Colors.black ,blurRadius:20 ) ,Shadow(color: Colors.yellow ,blurRadius:30 )]) ,
                              Text("Sunrise", style: TextStyle(
                                  color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                              ),),
                              Text("${weatherModel.sunrise}" ,style: TextStyle(
                                  color: Colors.white70 ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.nights_stay,size: 20,color: Colors.indigo,shadows: [Shadow(color: Colors.black ,blurRadius:20 ) ,Shadow(color: Colors.blue ,blurRadius:30 )],),
                              Text("Sunset", style: TextStyle(
                                  color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                              ),),
                              Text("${weatherModel.sunset}" ,style: TextStyle(
                                  color: Colors.white70 ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width:180,
                    height: 125,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2) ,
                      borderRadius: BorderRadius.circular(16) ,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.ac_unit ,size: 20,color: Colors.white,shadows: [Shadow(color: Colors.black ,blurRadius:20 ) ,Shadow(color: Colors.white ,blurRadius:30 )]) ,
                              Text("chance of snow", style: TextStyle(
                                  color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif"
                              ),),
                              Text("${weatherModel.chanceOfSnow}%" ,style: TextStyle(
                                  color: Colors.white70 ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                              ),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(Icons.water_drop,size: 20,color: Colors.lightBlueAccent,shadows: [Shadow(color: Colors.black ,blurRadius:20 ) ,Shadow(color: Colors.indigoAccent ,blurRadius:30 )],),
                              Text("Chance of rain", style: TextStyle(
                                  color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif"
                              ),),
                              Text("${weatherModel.chanceOfRain}%" ,style: TextStyle(
                                  color: Colors.white70 ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 180,
               margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2) ,
                  borderRadius: BorderRadius.circular(16) ,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Humidity", style: TextStyle(
                            color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                          Text("${weatherModel.humidity}%" ,style: TextStyle(
                            color: Colors.white70 ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Real feel", style: TextStyle(
                              color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                          Text("${weatherModel.realFeel}" ,style: TextStyle(
                              color: Colors.white70,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("UV", style: TextStyle(
                              color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                          Text("${weatherModel.uvIndex}" ,style: TextStyle(
                              color: Colors.white70,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Cloud", style: TextStyle(
                              color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                          Text("${weatherModel.cloud}" ,style: TextStyle(
                              color: Colors.white70,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Wind", style: TextStyle(
                              color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                          Text("${weatherModel.wind}" ,style: TextStyle(
                              color: Colors.white70 ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                        ],
                      ),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey[400],
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Pressure", style: TextStyle(
                              color: Colors.grey ,fontSize: 15 ,fontWeight: FontWeight.w800 ,fontFamily: "serif" ,letterSpacing: 1.5
                          ),),
                          Text("${weatherModel.pressure}mbar" ,style: TextStyle(
                              color: Colors.white70 ,fontSize: 13 ,fontWeight: FontWeight.w800 ,fontFamily: "serif"
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
