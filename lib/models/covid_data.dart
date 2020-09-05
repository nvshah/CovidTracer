import 'package:flutter/material.dart';

import './stats_count.dart';
import '../repositories/status_card_data.dart';

//List of all Status we're using to display informaion about
enum Status {
  total,
  active,
  recovered,
  deaths,
}

class CovidData {
  final StatsCount statsCount;
  final DateTime lastRefreshedDate;

  CovidData({
    @required this.statsCount,
    @required this.lastRefreshedDate,
  });
}
