import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:show_cuaca/models/CucaModels.dart';

class ApiCuaca {
  static Future<CuacaModel> getCuaca(String name) async {
    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=" +
        name +
        "&appid=041bc27ac6d0be8ec35077083bcd6f06&unit=metric");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return CuacaModel.fromJson(json);
    } else {
      return Future.error(
          Exception("Request failed with status: ${response.statusCode}."));
    }
  }
}
