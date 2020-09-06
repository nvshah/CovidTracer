import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/data_repository.dart';
import '../models/covid_data.dart';
import './status_card.dart';
import '../services/covid_api.dart';
import './last_updated_status.dart';
import './show_alert_dialog.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  CovidData _covidData;
  final List<Status> _statuses = Status.values;

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  //Get latest data from server
  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final covidData = await dataRepository.getData();

      setState(() {
        _covidData = covidData;
      });
    } on SocketException catch (_) {
      //await showAlertDialog   // --> Since we are not doing anythin after this so we can skip using await
      showAlertDialog(
        context: context,
        title: 'Connection Error !',
        content:
            'Could not fetch the data. Please check data connection & try again later.',
        defaultActionText: 'OK',
      );
    } catch (_) {
      //Incase we get 4xx or 5xx from server | parsing error | Missign APi Service
      showAlertDialog(
        context: context,
        title: 'Unknown Error !',
        content: 'Please contact support or try in a while.',
        defaultActionText: 'OK',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracer'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: Column(
          children: <Widget>[
            //Last Updated Date from Server
            LastUpdatedStatus(
              date: _covidData?.lastRefreshedDate,
            ),
            //Statuses
            Expanded(
              //Here ListView is used under Column, so need to provide specific height to ListView
              //otherwise it will give error as Column can grow as much as it can & Listview will not end up finding it's height
              //via Expanded we will ensure that Listview take rest of screen height
              child: ListView.builder(
                itemCount: _statuses.length,
                itemBuilder: (ctxt, idx) => StatusCard(
                  status: _statuses[idx],
                  numbers: _covidData != null
                      ? _covidData.statusFigures[_statuses[idx]]
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
