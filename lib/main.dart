import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/SplashScreen.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),/*create object from this class that i need to access from different places*/
      child: MaterialApp(
        title: 'Flutter Demo',
        home:SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
