import 'package:flutter/material.dart';

import '../services/covid_api.dart';

import './stats_count.dart';

class CovidData {
  final StatsCount statsCount;
  final DateTime lastRefreshedDate;

  CovidData({
    @required this.statsCount,
    @required this.lastRefreshedDate,
  });

  //Mapper to get stats for each status
  Map<Status, int> get statusFigures => {
    Status.total: statsCount.total,
    Status.active: statsCount.active,
    Status.recovered: statsCount.recovered,
    Status.deaths: statsCount.deaths,
  }; 
}
