getWeatherConditionImage(String condition ,int isDay){
  if(condition.contains("Clear")) {
  if (isDay == 0) {
    return "assets/moon/31.png" ;
  } else {
    return "assets/sun/27.png";
  }
  }
  else if(condition=="Sunny"){
    return "assets/sun/6.png" ;
  }
  else if(condition.contains("Cloudy") ||condition=="Overcast" ||condition=="Mist"
      ||condition=="Partly cloudy" ||condition=="Fog") {
    if (isDay == 1) {
      return "assets/sun/4.png";
    } else {
      return "assets/moon/41.png" ;
    }
  }
  else if(condition=="Moderate or heavy rain with thunder" || condition=="Patchy light rain with thunder") {
    if (isDay == 1) {
      return "assets/sun/30.png";
    } else {
       return "assets/moon/20.png" ;
    }
  }
  else if(condition.contains("rain")) {
    if(isDay==1){
    return "assets/sun/13.png";
    }else{
    return "assets/moon/3.png" ;
    }
  }
  else if(condition=="Thundery outbreaks possible"){
    return "assets/cloud/12.png" ;
  }
  else if(condition=="Patchy light snow with thunder" ||condition=="Moderate or heavy snow with thunder"){
    return "assets/cloud/29.png" ;
  }
  else if(condition.contains("snow") ||condition.contains("sleet") ||condition=="Blizzard"){
    return "assets/cloud/18.png";
  }
  else if(condition.contains("ice pellets") ||condition.contains("drizzle")){
    return "assets/rain/39.png";
  }
}