import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../repositories/status_card_data.dart';
import '../services/covid_api.dart';

class StatusCard extends StatelessWidget {
  final Status status; 
  final int numbers;

  StatusCard({Key key, @required this.status, @required this.numbers}) : super(key: key) ;

  //Mapper to get rest & static data of each status
  static Map<Status, StatusCardData> _cardDetails = {
     Status.total: StatusCardData(
      title: 'Cases',
      color: Color(0xFFFFF492),
      image: 'assets/count.png',
    ),
    Status.active: StatusCardData(
      title: 'Active Cases',
      color: Color(0xFFFFB74D),
      image: 'assets/fever.png',
    ),
    // Status.recovered: StatusCardData(
    //   title: 'Recovered',
    //   color: Color(0xFFA5D6A7),
    //   image: 'assets/suspect.png',
    // ),
    Status.deaths: StatusCardData(
      title: 'Deaths',
      color: Color(0xFFE57373),
      image: 'assets/death.png',
    ),
    Status.recovered: StatusCardData(
      title: 'Recovered',
      color: Color(0xFFAED581),
      image: 'assets/patient.png',
    ),
  };
  
  //getters for current status - card details
  StatusCardData get _data => _cardDetails[status];

  ///Format Number by adding comma to seperate thousand gaps
  String get _formattedNumber {
    if (numbers == null) {
      return '-';
    }
    final formatter = NumberFormat('#,###,###,###');
    return formatter.format(numbers);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Title
              Text(
                _data.title,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: _data.color),
              ),
              SizedBox(
                height: 5,
              ),
              //Image & numbers
              SizedBox(
                //giving specific height to Row
                height: 52,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Image
                    Image.asset(
                      _data.image,
                      color: _data.color,
                    ),
                    //Numbers
                    Text(
                      _formattedNumber,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: _data.color,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
