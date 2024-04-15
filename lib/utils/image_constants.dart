import '../enums/weather_icon_enum.dart';

class ImageConstants {
  static final ImageConstants _instance = ImageConstants._internal();
  final String _imageAssetPath = "assets/images";

  factory ImageConstants() {
    return _instance;
  }

  ImageConstants._internal() {
    //initialization logic here
  }

  String pngPath(String name) => "$_imageAssetPath/$name.png";
  String weatherPath(WeatherIcon icon) => "$_imageAssetPath/weather/${icon.name.toLowerCase()}.png";


}
