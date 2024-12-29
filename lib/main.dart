import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_withbloc/bloc/weather_bloc.dart';
import 'package:weather_app_withbloc/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<WeatherBloc>(
        create: (context) => WeatherBloc()..add(FetchWeather()),
        child: const HomeScreen(),
      ),
    );
  }
}
