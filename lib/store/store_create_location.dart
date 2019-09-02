import 'package:flutter/material.dart';

class StoreCreateLocation extends StatelessWidget {
  final String storeName ="맛있파스타";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('운영하고 계신 매장이 무엇입니까?'),
          Row(children: <Widget>[
            TextField(),
            FlatButton(child: Icon(Icons.search), onPressed: () {},),
          ],),
          Container(),
          Text('$storeName'),
          RaisedButton(child: Text('다음'),onPressed: () {},),
        ],
      ),
    );
  }
}
