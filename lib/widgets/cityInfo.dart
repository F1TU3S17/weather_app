import 'package:flutter/material.dart';
import 'package:weather/models/city.dart';


class cityInfo extends StatelessWidget {
  final City? city;
  final bool isInSearch;
  cityInfo({super.key, required this.city, required this.isInSearch});

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
          padding: const EdgeInsets.all(10.0),
          child: isInSearch
              ? (Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Населенный пункт: ${city!.name}'),
                    Text('Страна: ${city!.country}'),
                    Text("Широта: ${city!.latitude}"),
                    Text("Долгота: ${city!.longitude}"),
                  ],
                ))
              : Text('Нет города('),
        ),
      ),
    );
  
  }
}