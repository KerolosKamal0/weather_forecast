import 'dart:convert';
import 'package:advanced_weather_forecast_application/data/web_services/current_position.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherWebServices {
  Future<dynamic> getWeather() async {
    Position? position = await CurrentPosition().getCurrentPosition();
    String url = "https://api.openweathermap.org/data/2.5/weather?";
    String lat = "lat=${position?.latitude}";
    String lon = "&lon=${position?.longitude}";
    String appid = "&appid=887b082c5031200cfedd596a5f68ad03";

    final uri = Uri.parse(url + lat + lon + appid);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // error  ->  data not getted
    }
  }

  Future<dynamic> getTodayWeatherPerHour() async {
    Position? position = await CurrentPosition().getCurrentPosition();
    String url = "https://api.openweathermap.org/data/2.5/forecast?";
    String lat = "lat=${position?.latitude}";
    String lon = "&lon=${position?.longitude}";
    String appid = "&appid=887b082c5031200cfedd596a5f68ad03";

    final uri = Uri.parse(url + lat + lon + appid);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      // error  ->  data not getted
    }
  }
}
