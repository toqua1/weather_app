class WeatherModel {
  final String cityName;
  final String country;
  final String date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final int isDay;
  final List<ForecastDay> forecastDays;
  final String time1 ,time2 ,time3 ;
  final String condition1 , condition2 ,condition3 ;
  final double temp1 ,temp2 ,temp3;
  final int isDay1 , isDay2 , isDay3 ;
  final double wind ,realFeel ,uvIndex ,pressure ;
  final int chanceOfRain ,chanceOfSnow ,humidity ,cloud ;
  final String sunrise ,sunset ;

  WeatherModel({
    required this.sunrise,
    required this.sunset,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.wind,
    required this.realFeel,
    required this.humidity,
      required this.time1,
      required this.time2,
      required this.time3,
      required this.condition1,
    required this.condition2,
    required this.condition3,
    required this.temp1,
    required this.temp2,
    required this.temp3,
    required this.isDay1,
    required this.isDay2,
    required this.isDay3,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.isDay,
    required this.cityName,
    required this.country,
    required this.temp,
    required this.forecastDays,
    required this.uvIndex,
    required this.pressure,
    required this.cloud,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> forecastData = json['forecast']['forecastday'];

    final forecastDays = List.generate(
      forecastData.length,
          (index) => ForecastDay.fromJson(forecastData[index]),
    );

    return WeatherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      date: json['current']['last_updated'],
      temp: json['current']['temp_c'],
      maxTemp: forecastDays[0].maxTemp,
      minTemp: forecastDays[0].minTemp,
      weatherCondition: json['current']['condition']['text'],
      isDay: json['current']['is_day'],
      forecastDays: forecastDays,

      time1: forecastData[0]['hour'][0]['time'],
      time2: forecastData[0]['hour'][12]['time'],
      time3:forecastData[0]['hour'][18]['time'],
      condition1: forecastData[0]['hour'][0]['condition']['text'],
      condition2:  forecastData[0]['hour'][12]['condition']['text'],
      condition3:  forecastData[0]['hour'][18]['condition']['text'],
      temp1: forecastData[0]['hour'][0]['temp_c'] ,
      temp2: forecastData[0]['hour'][12]['temp_c'] ,
      temp3: forecastData[0]['hour'][18]['temp_c'] ,
      isDay1: forecastData[0]['hour'][0]['is_day'],
      isDay2: forecastData[0]['hour'][12]['is_day'],
      isDay3: forecastData[0]['hour'][18]['is_day'],
      wind: json['current']['wind_kph'],
      realFeel: json['current']['feelslike_c'],
      humidity: json['current']['humidity'],
      chanceOfRain: forecastData[0]['day']['daily_chance_of_rain'],
      chanceOfSnow: forecastData[0]['day']['daily_chance_of_snow'],
      sunrise: forecastData[0]['astro']['sunrise'] ,
      sunset: forecastData[0]['astro']['sunset'],
      uvIndex: json['current']['uv'],
      pressure: json['current']['pressure_mb'],
      cloud: json['current']['cloud'],
    );
  }
}

class ForecastDay {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  ForecastDay({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      maxTemp: json['day']['maxtemp_c'],
      minTemp: json['day']['mintemp_c'],
      weatherCondition: json['day']['condition']['text'],
    );
  }
}
