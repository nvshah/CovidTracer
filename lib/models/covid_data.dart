import 'package:flutter/foundation.dart';

import './stats_count.dart';

class CovidData {
  final StatsCount statsCount;
  final DateTime lastRefreshedDate;

  CovidData({
    @required this.statsCount,
    @required this.lastRefreshedDate,
  });

}
