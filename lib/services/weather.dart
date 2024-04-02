import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey='';
class WeatherModel {
  Future<dynamic> getcityweather(String cityname)
  async
  {
    var url='https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&unit=metrics';
    Networking networking=Networking(url);
    var weatherdata= await networking.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationWeather()async
  {
    Location location=Location();
    await location.determinePosition();
    Networking networking=Networking('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitute}&lon=${location.logitude}&appid=$apiKey&unit=metrics');

    var weatherdata=networking.getdata();
    return weatherdata;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
