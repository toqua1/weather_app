import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/dailyWeatherItem.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/weatherImage.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
class DetailedWeather extends StatelessWidget {
  WeatherModel weatherModel ;
   DetailedWeather({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
     weatherModel=BlocProvider.of<GetWeatherCubit>(context ).weatherModel ;
     if (weatherModel == null) {
       return Scaffold(
         body: Center(
           child: CircularProgressIndicator(),
         ),
       );
     }

     return Scaffold(
      backgroundColor: Colors.black,
      body:
          Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(-3, -0.1),
                child: Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.amber[900],
                    shape:BoxShape.circle ,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(3, 0.9),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                ),
              ),
              BackdropFilter(
                  filter:ImageFilter.blur(sigmaX: 150 ,sigmaY: 150),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    IconButton(
                         onPressed: (){
                           Navigator.pop(context) ;
                         },
                         icon:Icon(Icons.arrow_back_ios_new ,color: Colors.white,),
                     ),
                    SizedBox(
                      height: 10,
                    ),
                   Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                       child: Column(
                         children: [
                           ListItem(weatherModel.weatherCondition ,weatherModel.maxTemp ,weatherModel.minTemp, getWeatherConditionImage(weatherModel.weatherCondition,weatherModel.weatherCondition =="Sunny" ? 1: 0 ), weatherModel.date),
                           SizedBox(height: 20),
                           ListItem(weatherModel.forecastDays[1].weatherCondition,weatherModel.forecastDays[1].maxTemp,weatherModel.forecastDays[1].minTemp,getWeatherConditionImage(weatherModel.forecastDays[1].weatherCondition,weatherModel.forecastDays[1].weatherCondition =="Sunny"? 1:0),weatherModel.forecastDays[1].date),
                           SizedBox(height: 20),
                           ListItem(weatherModel.forecastDays[2].weatherCondition,weatherModel.forecastDays[2].maxTemp,weatherModel.forecastDays[2].minTemp,getWeatherConditionImage(weatherModel.forecastDays[2].weatherCondition, weatherModel.forecastDays[2].weatherCondition =="Sunny"? 1:0),weatherModel.forecastDays[2].date),
                           SizedBox(height: 20),
                           ListItem(weatherModel.forecastDays[3].weatherCondition ,weatherModel.forecastDays[3].maxTemp,weatherModel.forecastDays[3].minTemp,getWeatherConditionImage(weatherModel.forecastDays[3].weatherCondition, weatherModel.forecastDays[3].weatherCondition =="Sunny"? 1:0),weatherModel.forecastDays[3].date),
                           SizedBox(height: 20),
                           ListItem(weatherModel.forecastDays[4].weatherCondition ,weatherModel.forecastDays[4].maxTemp,weatherModel.forecastDays[4].minTemp,getWeatherConditionImage(weatherModel.forecastDays[4].weatherCondition, weatherModel.forecastDays[4].weatherCondition =="Sunny"? 1:0),weatherModel.forecastDays[4].date),
                         ],
                       ),
                     ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
