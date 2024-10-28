import 'package:flutter/material.dart';
import 'package:weather/widgets/cityInfo.dart';
import 'package:weather/widgets/cityWeather.dart';
import 'package:weather/widgets/mapscreen.dart';
import 'package:weather/widgets/search.dart';
import 'package:weather/models/city.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  City? _city;
  bool _isInSearch = false;

  void _onSearchComplete(City city, bool isInSearch) {
    setState(() {
      _city = city;
      _isInSearch = isInSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Погода'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Search(
              onSearchComplete: _onSearchComplete,
            ),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: cityInfo(
                    city: _city, 
                    isInSearch: _isInSearch
                  ),
                ),
                Expanded(
                  child: cityWeather(
                    city: _city, 
                    isInSearch: _isInSearch,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            ElevatedButton( 
            
              onPressed: _isInSearch ? () { 
                Navigator.push( 
                    context, 
                    MaterialPageRoute( 
                      builder: (context) => 
                        MapScreen(
                          title: _city!.name,
                          latitude: _city!.latitude,
                          longitude: _city!.longitude,
                        ))); 
                }: null, 
                child: 
                  Text(_isInSearch ? ("Место на карте") :('Мы еще не знаем места'), style: const TextStyle(color: Colors.black,)),   
            ),
        ],
        )
      ),
      
    );
  }

  
}
