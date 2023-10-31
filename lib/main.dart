import 'package:advanced_weather_forecast_application/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/weather_cubit.dart';
import 'data/repository/weather_repository.dart';
import 'data/web_services/weather_web_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (BuildContext context) => WeatherCubit(
          WeatherRepository(WeatherWebServices()),
        ),
        child: const HomePage(),
      ),
    );
  }
}
