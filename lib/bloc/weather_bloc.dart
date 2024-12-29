import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_withbloc/data/my_data.dart';
import 'package:weatherapi/weatherapi.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherRequest wr = WeatherRequest(API_KEY, language: Language.russian);
        RealtimeWeather weather = await wr.getRealtimeWeatherByCityName('Omsk');
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}
