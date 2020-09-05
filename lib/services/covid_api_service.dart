import 'package:chopper/chopper.dart';

import '../models/stats_count.dart';

import 'built_value_converter.dart';

part 'covid_api_service.chopper.dart';


//specifying only endpoint i.e /covid19-in
@ChopperApi(baseUrl: '/covid19-in')
abstract class CovidApiService extends ChopperService {

  @Get(path: '/stats/latest')
  Future<Response> getStats();

  static CovidApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.rootnet.in',
      services: [
        //the generated implementation
        _$CovidApiService(),
      ],
      //Converts data to & from JSON and adds the application/json header
      converter: BuiltValueConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$CovidApiService(client);
  }
}
