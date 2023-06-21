import 'package:flutter/material.dart';
import 'package:flutter_assesment_2/models/forecast_model.dart';

class ForeCastScreen extends StatelessWidget {
  const ForeCastScreen({super.key, required this.foreCastModel});
  final ForeCastModel? foreCastModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: foreCastModel?.forecast.forecastday.length ?? 0,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              'http:${foreCastModel?.forecast.forecastday[index].day.condition.icon}',
            ),
            title: Text(foreCastModel?.forecast.forecastday[index].date ?? ''),
            trailing: Text(foreCastModel
                    ?.forecast.forecastday[index].day.avgtempC
                    .toString() ??
                ""),
          );
        },
      ),
    );
  }
}
