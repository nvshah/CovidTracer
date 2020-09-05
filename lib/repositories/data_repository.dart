import 'package:flutter/foundation.dart';

import '../services/covid_api_service.dart';
import '../models/covid_data.dart';

class DataRepository{
  final CovidApiService covidApiService;

  DataRepository({@required this.covidApiService,});

  Future<CovidData> getData() async{
    //get data via api-service
    final response = await covidApiService.getStats();

    //successful
    if(response.statusCode == 200){
      // We will get our desire model inside body (i.e StatsCount ) as chopper-converter
      final body = response.body;

      if(body != null){
        final statsCount = body['data'];
        final date = DateTime.tryParse(body['lastRefreshed']);

        //We get data we wanted
        if(statsCount != null){
          return CovidData(
            lastRefreshedDate: date,
            statsCount: statsCount,
          );
        }
      }      
    }
    //Something went wrong - We will handle on UI side
    throw response;
  }
}