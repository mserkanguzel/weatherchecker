import 'package:flutter/material.dart';
import 'package:weatherchecker/extensions/weather_extension.dart';
import '../../../models/weather_model.dart';

class WeatherSuccessWidget extends StatelessWidget {
  final OpenWeatherMapDTO data;
  const WeatherSuccessWidget({
    super.key,
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            color: const Color(0xFF192C49),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.name ?? "",style: const TextStyle(color: Colors.white),),
                  Text(data.description ?? "",style: const TextStyle(color: Colors.white),),
                  Image.asset(data.weatherIcon,scale: 2.4,),
                ],
              ),
            ),
          )),
    );
  }

}
