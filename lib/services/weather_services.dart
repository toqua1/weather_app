import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
class WeatherService{

final Dio dio ;
final String baseUrl ='https://api.weatherapi.com/v1' ;
final String apiKey = '73930366ccd44dfaadd194539242302' ;

//to deal with request that will get data from internet
WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName})async{
    // here we use try and catch not if...else as Dio's internal implementation
    // has this check of statusCode , So when to use if..else => using http package
    // that its function same as Dio package
    try{
    Response response=await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=5&aqi=no&alerts=no');
   // if(response.statusCode==200) {
     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel ;
   // }else{
   // final String errorMessage =response.data['error']['message'];
   // throw Exception(errorMessage);
   }on DioException catch(e){ /* e => exception */
     //  ? => if statement not null , ?? => if statement null
     //  we use ?? as if statemnt (e.response) is null then errorMessage equals null and throw Exceoption(null)
     final String errorMessage =e.response?.data['error']['message'] ?? 'oops there was an error ,try' ;
     throw Exception(errorMessage) ;
    }catch(e){/*as DioException handle only errors by Dio , and this handle remaining errors*/
     log(e.toString()); /*this for developer in debuging to know what is the error*/
      throw Exception('oops there was an error , try later') ;
    }
  }
}