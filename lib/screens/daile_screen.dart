// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_assesment_2/models/weather_model.dart';

class DailyScreen extends StatelessWidget {
  final WeatherModel? weatherModel;
  const DailyScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Weather'),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  'http:${weatherModel?.current.condition.icon}',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              TextRow(text: 'Location:'),
              TextRow(text: 'name: ${weatherModel?.location.name}'),
              TextRow(text: 'region: ${weatherModel?.location.region}'),
              TextRow(text: 'country:${weatherModel?.location.country}'),
              TextRow(text: 'timezone: ${weatherModel?.location.localtime}'),
              TextRow(text: 'last update: ${weatherModel?.location.lat}'),
            ],
          );
        }),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String text;

  const TextRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_forward),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
