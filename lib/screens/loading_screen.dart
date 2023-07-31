import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/utilities/constants.dart';

import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
  }

  void getLocationData() async {
    LocationPermission permission = await Geolocator.requestPermission();
    WeatherModel weatherModel = new WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LocationScreen(
            weatherData: weatherData,
          );
        }),
      );
    } else {
      print('Location permit denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
