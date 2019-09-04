import 'package:ad_store_app/store/store_create_location.dart';
import 'package:flutter/material.dart';


void main() => runApp(AdStore());

class AdStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'disCount Down',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.redAccent,
        secondaryHeaderColor: Colors.amber,

      ),
      home: AdStorePage(),
    );
  }
}

class AdStorePage extends StatefulWidget {
  @override
  _AdStorePageState createState() => _AdStorePageState();
}

class _AdStorePageState extends State<AdStorePage> {
  void navigate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StoreCreateLocation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 500),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Text(
                  '로그인',
                  style: TextStyle(fontSize: 20),
                ),
                RaisedButton(
                  child: Text('카카오톡 로그인'),
                  onPressed: navigate,
                ),
              ],
            ),
          ),
        ));
  }
}
