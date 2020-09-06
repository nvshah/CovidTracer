import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdatedStatus extends StatelessWidget {
  final DateTime date;

  LastUpdatedStatus({Key key, @required this.date}) : super(key: key);

  ///Format the date using intl package
  ///i/p -> DateTime obj
  ///o/p -> String, formatted date
  String _dateFormatter(DateTime date) {
    if (date != null) {
      final formatter = DateFormat.yMMMd().add_Hms();
      final formattedDate = formatter.format(date);
      return formattedDate;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        date != null ? 'Last Updated: ${_dateFormatter(date)}' : '',
        textAlign: TextAlign.center,
      ),
    );
  }
}
