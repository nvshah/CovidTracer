import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'stats_count.dart';

part 'serializers.g.dart';

@SerializersFor(const [StatsCount])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();