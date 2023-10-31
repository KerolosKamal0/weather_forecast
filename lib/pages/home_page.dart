import 'package:advanced_weather_forecast_application/business_logic/weather_cubit.dart';
import 'package:advanced_weather_forecast_application/business_logic/weather_state.dart';
import 'package:advanced_weather_forecast_application/data/models/weather.dart';
import 'package:advanced_weather_forecast_application/data/models/weather_day.dart';
import 'package:advanced_weather_forecast_application/pages/widgets/weather_hour.dart';
import 'package:advanced_weather_forecast_application/pages/widgets/weather_next_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Weather weather;
  late List<WeatherDay> weatherWeekDays;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 77, 201, 250),
                Color.fromARGB(255, 46, 116, 255),
              ],
            ),
          ),
        ),
        SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<WeatherCubit, WeatherState>(
                      builder: (context, state) {
                        if (state is WeatherLoaded) {
                          weather = (state).weather;
                          weatherWeekDays = (state).weatherWeekDays;
                          return Column(
                            children: [
                              Image.network(
                                "https://openweathermap.org/img/wn/${weather.weatherIcon}@4x.png",
                                width: MediaQuery.of(context).size.width * 0.4,
                              ),
                              Text(
                                "${weather.city}, ${weather.country}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${weather.temp.ceil()}°",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Text(
                                weather.weatherDescription,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "H:${weather.tempMax.ceil()}°   L:${weather.tempMin.ceil()}°",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const SizedBox(height: 10),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Today",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${DateFormat('EEEE').format(DateTime.now())}, ${DateTime.now().day}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 15,
                                ),
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                height: 165,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                child: weather.weatherDay!.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: weather.weatherDay?.length,
                                        itemBuilder: (context, index) {
                                          return WeatherHour(
                                            tempWeather:
                                                weather.weatherDay![index].temp,
                                            iconWeather: weather
                                                .weatherDay![index].weatherIcon,
                                            dateWeather:
                                                weather.weatherDay![index].date,
                                          );
                                        },
                                      )
                                    : Container(),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                  ),
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Next Forecase",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 15,
                                ),
                                padding: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                height: 280,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                child: weatherWeekDays.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: weatherWeekDays.length,
                                        itemBuilder: (context, index) {
                                          return WeatherNextDay(
                                            weatherDay: weatherWeekDays[index],
                                          );
                                        },
                                      )
                                    : Container(),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
