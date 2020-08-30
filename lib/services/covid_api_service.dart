import 'package:chopper/chopper.dart';

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
      converter: JsonConverter(),
    );
    return _$CovidApiService(client);
  }
}
