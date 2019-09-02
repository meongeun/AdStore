library wheel_spinner;

import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';


class UserCreateTarget extends StatefulWidget {
  @override
  _UserCreateTargetState createState() => _UserCreateTargetState();
}

class _UserCreateTargetState extends State<UserCreateTarget> {
  var dropdownValueAge = "10대";
  var dropdownValueCity = "서울시";
  var dropdownValueLocal = "동작구";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('타깃 고객층은 어디입니까?'),
          Text('성별'),
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                child: Text(
                  "Basic RadioButtonGroup",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              RadioButtonGroup(
                labels: [
                  "남",
                  "여",
                ],
                disabled: ["남"],
                onChange: (String label, int index) =>
                    print("label: $label index: $index"),
                onSelected: (String label) => print(label),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('연령대'),
              DropdownButton<String>(
                value: dropdownValueAge,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValueAge = newValue;
                  });
                },
                items: <String>['10대', '20대', '30대', '40대', '50대', '60대이상']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text('위치'),
              Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownValueCity,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueCity = newValue;
                      });
                    },
                    items: <String>[
                      '서울특별시',
                      '부산광역시',
                      '인천광역시',
                      '광주광역시',
                      '대구광역시',
                      '대전광역시',
                      '을산광역시'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: dropdownValueLocal,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValueLocal = newValue;
                      });
                    },
                    items: <String>['동작구', '은평구', '서대문구', '관악구', '강남구', '영등포구']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('이전'),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('저장'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
