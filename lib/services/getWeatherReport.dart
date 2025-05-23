import 'dart:convert';
import 'dart:developer';
import '../model/weatherModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<WeatherModel>?> fetchWeather(double latitude, double longitude, String apiKey) async {
    final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
    final String units = 'metric'; // You can change this to 'imperial' for Fahrenheit units

    final Uri uri = Uri.parse('${baseUrl}?lat=${27.7215}&lon=${85.3201}&appid=31cae416c96a430580fec55352eb2f00');

    final response = await http.get(uri);
log(response.body.toString());
log('https://api.openweathermap.org/data/2.5/weather?lat=${27.7215}&lon=${85.3201}&appid=31cae416c96a430580fec55352eb2f00');
    if (response.statusCode == 200) {
      log(response.body.toString());
      final Map<String, dynamic> data = json.decode(response.body);
      final WeatherModel weather = WeatherModel?.fromJson(data); // Assuming WeatherModel.fromJson creates a single WeatherModel instance

      return [weather];
    }
  }

}