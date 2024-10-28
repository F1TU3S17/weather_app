import 'package:flutter/material.dart';
import 'package:weather/routers/weather_api.dart';
import 'package:weather/models/city.dart';


class Search extends StatefulWidget {
  final Function(City city, bool isInSearch) onSearchComplete;

  Search({
    required this.onSearchComplete,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextField(
        decoration: const InputDecoration(
          icon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Введите название',
        ),
        onSubmitted: (text) {
          WeatherApi.fetchWeather(text).then((data) {
            final City city = City.fromJson(data);
            setState(() {
              widget.onSearchComplete(city, true);
            });
          }).catchError((error) {
            print('Error: $error');
          });
        },
      ),
    );
  }
}
