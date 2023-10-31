import 'package:advanced_weather_forecast_application/data/models/weather_day.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/weather.dart';
import '../data/repository/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  Weather? weather;
  List<WeatherDay>? weatherWeekDays;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Weather? getWeather() {
    weatherRepository.getWeather().then((weather) {
      weatherRepository.getTodayWeatherPerHour().then((weatherDay) {
        List<WeatherDay> weatherWeekDays = [];
        List<WeatherDay> weatheTodayHours = [];
        int lastDay = DateTime.now().day;
        for (var i = 0; i < weatherDay.length; i++) {
          if ((weatherDay[i].date.day == DateTime.now().day) &&
              (weatherDay[i].date.month == DateTime.now().month) &&
              (weatherDay[i].date.year == DateTime.now().year)) {
            weatheTodayHours.add(weatherDay[i]);
          } else {
            if (weatherDay[i].date.day != lastDay) {
              weatherWeekDays.add(weatherDay[i]);
              lastDay = weatherDay[i].date.day;
            }
          }
        }
        weather.weatherDay = weatheTodayHours;
        this.weatherWeekDays = weatherWeekDays;
        this.weather = weather;
        emit(WeatherLoaded(weather, weatherWeekDays));
      });
    });
    return weather;
  }
}
