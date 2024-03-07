import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_waether_states.dart';
import '../../models/weather_model.dart';
import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit <WeatherState>
{
  GetWeatherCubit() :super(WeatherInitialState());
  late WeatherModel weatherModel ;
  getWeather({required String cityName}) async{
    try {
       weatherModel =
      await WeatherService(Dio()).getCurrentWeather(cityName :cityName) ;
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}