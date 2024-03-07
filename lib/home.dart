import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/InitialWeatherState.dart';
import 'package:weather_app/NoMatchingState.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_waether_states.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/weather_services.dart';
import 'cityTemp.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  TextEditingController searchController =TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181146),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.0 ,bottom: 10 ,top: 10),
            child: Text("Weather" ,style: TextStyle(
              fontSize: 30 ,fontWeight: FontWeight.w800 , color: Colors.white ,letterSpacing: 4,fontFamily: 'Cinzel'
               , shadows: [
                Shadow(
                offset: Offset(5.0, 5.0),
              blurRadius:2.0,
              color: Colors.grey.withOpacity(0.5),
            ),
            ],
            ),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: TextField(
              onSubmitted: (value) async{
                 var getWeatherCubit = await BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                // Navigator.pop(context) ;
                 },
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintText: "Search for a city",
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.search_rounded ,color: Colors.grey[600]),
                prefixIconColor: Colors.grey ,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide.none ,
                ),
              ),
            ),
          ),
         // important to mention which cubit will be used in this BlocBuilder as there may be many cubits
         BlocBuilder<GetWeatherCubit,WeatherState>(
             builder: (context ,state){
               if(state is WeatherInitialState){
                 return InitialWeatherState();
               }else if(state is WeatherLoadedState){
                 return CityTemp();
               }else{
                 return NotMatchedCity() ;
               }
             }
         ),
        ],
      ),
    );
  }
}
