import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Temperature \n $temperature°  Celcius',
                style: kTempTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              MyWidgetTime(),
              SizedBox(height: 20),
              MyWidgetDate(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidgetTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var time = DateFormat.jm().format(now);
    print(now);
    return Text(
      'Current Time : $time',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyWidgetDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();

    return Text(
      'Current Date : ${now.day}/${now.month}/${now.year}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
