// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CovidApiService extends CovidApiService {
  _$CovidApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CovidApiService;

  Future<Response> getStats() {
    final $url = '/covid19-in/stats/latest';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
