import 'package:flutter/material.dart';

import '../models/city.dart';


class cityWeather extends StatelessWidget {
  final City? city;
  final bool isInSearch;
  const cityWeather({
    super.key,
    required this.city,
    required this.isInSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: isInSearch
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Текущая погода'),
                      Row(
                        children: [
                          Image.network(
                              //city!.currentData.condition.icon!,
                              "https://cdn.weatherapi.com/weather/64x64/night/116.png",
                              width: 30, // Указываем ширину
                              height: 30, // Указываем высоту
                          ),
                                
                          Text(
                              "${city!.currentData.condition.text}"),
                        ],
                      ),
                      Text(
                          "Температура: ${city!.currentData.temperatureC}°"),
                    ],
                  )
                : const Text('Информация отсутсвует'),
          )),
    );
  }
}

