import '../models/weather.dart';
import '../models/weather_day.dart';
import '../web_services/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices weatherWebServices;
  WeatherRepository(this.weatherWebServices);

  Future<Weather> getWeather() async {
    final weatherjson = await weatherWebServices.getWeather();
    Weather weather = Weather.fromJson(weatherjson);
    return weather;
  }

  Future<List<WeatherDay>> getTodayWeatherPerHour() async {
    final weatherjson = await weatherWebServices.getTodayWeatherPerHour();
    List<WeatherDay> weatherDays = [];
    for (var i = 0; i < weatherjson["list"].length; i++) {
      WeatherDay weatherDay = WeatherDay.fromJson(weatherjson["list"][i]);
      weatherDays.add(weatherDay);
    }
    return weatherDays;
  }
}
