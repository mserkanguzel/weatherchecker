import 'package:flutter/material.dart';

class WeatherErrorWidget extends StatelessWidget {
  final String errorMessage;
  const WeatherErrorWidget({
    super.key, required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}