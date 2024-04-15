
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherchecker/ui/widgets/weather/weather_loading_widget.dart';
import '../../../api_layer/repository/weather_repository/weather_repository.dart';
import '../../widgets/weather/weather_success_widget.dart';
import 'cubit/weather_cubit.dart';
import '../../widgets/weather/weather_error_widget.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});
  final WeatherCubit cubit = WeatherCubit(weatherRepository: WeatherRepository());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
            create: (context) => cubit..fetchWeather()
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            switch (state) {
              case WeatherLoadingState():
                return const WeatherLoadingWidget();
              case WeatherLoadedState():
                return WeatherSuccessWidget(data: state.data);
              case WeatherErrorState():
                return WeatherErrorWidget(errorMessage: state.errorMessage);
            }
          },
        ),
      ),
    );
  }
}
