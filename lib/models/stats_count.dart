library stats_count;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'stats_count.g.dart';

abstract class StatsCount implements Built<StatsCount, StatsCountBuilder> {
  int get total;
  int get recovered;
  int get deaths;
  int get active;

  StatsCount._();

  factory StatsCount([updates(StatsCountBuilder b)]) = _$StatsCount;

  static Serializer<StatsCount> get serializer => _$statsCountSerializer;
}