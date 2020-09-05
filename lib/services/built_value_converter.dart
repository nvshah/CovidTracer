import 'dart:convert';

import 'package:chopper/chopper.dart';
import '../models/serializers.dart';
import '../models/stats_count.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(
      Response response) {
    //this will convert either to dynamic maps or list of maps
    final Response dynamicResponse = super.convertResponse(response);

    final rawBody = dynamicResponse.body;
    StatsCount customBody;
    if ((rawBody ?? const {})["data"] != null) {
      if (rawBody["data"]["unofficial-summary"] != null) {
        customBody = _deserialize(rawBody["data"]["unofficial-summary"][0]);
      }
    }
    rawBody['data'] = customBody;

    return dynamicResponse.replace<BodyType>(body: rawBody);
  }

  //Will parse the json obj & give StatsCount object from it
  StatsCount _deserialize<StatsCount>(
    Map<String, dynamic> value,
  ) {
    return serializers.deserializeWith(
        serializers.serializerForType(StatsCount), value);
  }
}
