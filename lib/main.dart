import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

import './services/covid_api_service.dart';
import './ui/dashboard.dart';
import './repositories/data_repository.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      // The initialized CovidApiService is now available down the widget tree
      create: (_) => DataRepository(
        covidApiService: CovidApiService.create(),
      ),
      //Always call dispose on the ChopperClient to release resources
      dispose: (ctxt, DataRepository dataRepository) => dataRepository.covidApiService.client.dispose(),
      child: MaterialApp(
        title: 'Covid Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222),
        ),
        home: Dashboard(),
      ),
    );
  }
}

// Logger is a package from the Dart team. While you can just simply use print()
// to easily print to the debug console, using a fully-blown logger allows you to
// easily set up multiple logging "levels" - e.g. INFO, WARNING, ERROR.

// Chopper already uses the Logger package. Printing the logs to the console requires
// the following setup.
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
