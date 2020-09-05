import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/data_repository.dart';
import '../models/covid_data.dart';
import './status_card.dart';

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
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final covidData = await dataRepository.getData();

    setState(() {
      _covidData = covidData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracer'),
      ),
      body: ListView.builder(
        itemBuilder: (ctxt, idx) => StatusCard(
          status: _statuses[idx],
          numbers: _covidData.statusFigures[_statuses[idx]],
        ),
        itemCount: _statuses.length,
        //padding: EdgeInsets.all(8.0),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () async {
      //     // The JSONPlaceholder API always responds with whatever was passed in the POST request
      //     final covidData =
      //          await Provider.of<DataRepository>(context).getData();
      //     print(covidData.lastRefreshedDate.toString());
      //   },
      // ),
    );
  }
}
