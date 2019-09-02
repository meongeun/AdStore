import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class StoreCreateTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Text('월'),
    FlatButton(
    onPressed: () {
    DatePicker.showDatePicker(context,
    showTitleActions: true,
    minTime: DateTime(2018, 3, 5),
    maxTime: DateTime(2019, 6, 7), onChanged: (date) {
    print('change $date');
    }, onConfirm: (date) {
    print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.ko);
    },
    child: Text(
    'show date time picker (Korean)',
    style: TextStyle(color: Colors.blue),
    )),

      ],),
    ],);
  }
}
