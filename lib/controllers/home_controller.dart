import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeController extends GetxController {
  WeatherService weatherService = WeatherService(
    apiKey: 'YOUR-API-KEY',
  );
  Rx<WeatherModel> weatherModel = Rx<WeatherModel>(WeatherModel());

  @override
  void onInit() async {
    await fetchWeather();
    super.onInit();
  }

  Future<void> fetchWeather() async {
    String cityName = await weatherService.getCurrentCity();

    try {
      WeatherModel weather = await weatherService.getWeather(
        cityName: cityName,
      );
      weatherModel.value = weather;
    } catch (e) {}
  }

  String weatherAnimation({String? mainCondition}) {
    if (mainCondition == null) return 'assets/sunny.json';

    mainCondition = '';

    switch (mainCondition) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/windy.json';
    }
  }
}
