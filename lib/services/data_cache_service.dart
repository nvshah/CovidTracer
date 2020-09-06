import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

import '../services/covid_api.dart';
import '../models/covid_data.dart';
import '../models/stats_count.dart';

class DataCacheService{
  final SharedPreferences sharedPrefernces;

  DataCacheService({@required this.sharedPrefernces});

  //Get status-numbers key for caching
  static String _statusValueKey(Status status) => '$status/value';

  //Retrieve Data from Cache
  CovidData getData(){
    //hold figures for each status from cache
    Map<Status, int> statusNumbers = {};

    //get values for each status from cache
    Status.values.forEach((status){
      final numbers = sharedPrefernces.getInt(_statusValueKey(status));
      statusNumbers[status] = numbers;
    });

    //create statscount data class
    StatsCount statsCount = StatsCount((b) => b
    ..total = statusNumbers[Status.total]
    ..active = statusNumbers[Status.active]
    ..recovered = statusNumbers[Status.recovered]
    ..deaths = statusNumbers[Status.deaths]);
           
    //get Date from cache
    final dateString = sharedPrefernces.getString('date');
    DateTime date;
    if(dateString != null)
      date = DateTime.tryParse(dateString);

    return CovidData(statsCount: statsCount, lastRefreshedDate: date,);
  }
  
  //caching data ( Offline mode )
  Future<void> saveData(CovidData covidData) async{
    //Date
    sharedPrefernces.setString('date', covidData.lastRefreshedDate.toIso8601String());
    //Stats
    Status.values.forEach((status) async {
      await sharedPrefernces.setInt(_statusValueKey(status), covidData.statusFigures[status]);
    });
  }
}