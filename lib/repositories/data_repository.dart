import 'package:flutter/foundation.dart';

import '../services/covid_api_service.dart';
import '../models/covid_data.dart';
import '../services/data_cache_service.dart';

class DataRepository {
  final CovidApiService covidApiService;
  final DataCacheService dataCacheService;

  DataRepository({
    @required this.covidApiService,
    @required this.dataCacheService,
  });

  ///Get stats data from server
  Future<CovidData> getData() async {
    //get data via api-service
    final response = await covidApiService.getStats();

    //successful
    if (response.statusCode == 200) {
      // We will get our desire model inside body (i.e StatsCount ) as chopper-converter
      final body = response.body;

      if (body != null) {
        final statsCount = body['data'];
        //2020-08-30T13:30:21.667Z <- date format sample -> yyyy-MM-ddThh:mm::ss.....
        final date = DateTime.tryParse(body['lastRefreshed']);

        //We get data we wanted
        if (statsCount != null) {
          final covidData = CovidData(
            lastRefreshedDate: date,
            statsCount: statsCount,
          );
          //save data to cache
          dataCacheService.saveData(covidData);
          return covidData;
        }
      }
    }
    //Something went wrong - We will handle on UI side
    throw response;
  }
  
  ///Get data from cache
  CovidData get getCachedData => dataCacheService.getData();
}