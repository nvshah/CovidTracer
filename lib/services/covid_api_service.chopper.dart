// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CovidApiService extends CovidApiService {
  _$CovidApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CovidApiService;

  @override
  Future<Response<dynamic>> getStats() {
    final $url = '/covid19-in/stats/latest';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
