import 'package:flutter/material.dart';
import 'package:show_cuaca/models/CucaModels.dart';
import 'package:show_cuaca/service/CuacaService.dart';

class Cuaca extends StatelessWidget {
  const Cuaca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: ApiCuaca.getCuaca("tangerang"),
      builder: (contex, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            child: Center(
              child: Column(
                children: [
                  ListTile(
                    title: Text("Tempratur"),
                    subtitle: Text(snapshot.data.main.temp.toString()),
                  ),
                  // ListTile()
                  // Image(image:)
                  Image.network(
                      "http://openweathermap.org/img/wn/${snapshot.data.weather[0].icon}@2x.png")
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
