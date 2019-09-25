import 'dart:async';
import 'dart:convert';
import 'package:ad_store_app/store/store_keyword.dart';
import 'package:http/http.dart' as http;
import 'package:ad_store_app/ad/ad_read.dart';
import 'package:ad_store_app/user/user_create_target.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class StoreCreateLocation extends StatefulWidget {
  @override
  _StoreCreateLocationState createState() => _StoreCreateLocationState();
}

class _StoreCreateLocationState extends State<StoreCreateLocation> {
  final String storeName = "맛있파스타";
  final items = List<String>.generate(100, (i) => "Item $i");

  TextEditingController searchController = TextEditingController();
  bool _firstSearch = true;
  String query = "";

  List _names = new List();
  List _filteredNames = new List();

  TextEditingController nowController = TextEditingController();
  Position position;

  Icon _searchIcon = new Icon(Icons.search);

  _StoreCreateLocationState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          query = "";
        });
      } else {
        setState(() {
          _firstSearch = true;
          query = searchController.text;
        });
      }
    });
  }

  void getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  void onPositionChanged() async {
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());
    });
  }



  Future<List<Documents>> getData2() async {
    var client = http.Client();
    var url =
        "https://dapi.kakao.com/v2/local/search/keyword.json?query=$query";

    //var url ="https://naver.com";
    var response = await client.get(url, headers: {
      'Authorization': 'KakaoAK ae4e5876a5837c3a9d86a013b530c88d',
    });

    print('good');
    print(response.statusCode);
    print(response.body);

    var jsonData = json.decode(response.body);
    //response.body를 json으로 바꿈
    //Photo photo2 = Photo(1,1,"album title", "url", "thumbnailUrl");
    StoreKeyword storeLocation = StoreKeyword.fromJson(jsonData);
    //json형식을 class로 바꿈  클래쓰를 사용하는 2가지 방법
    print(storeLocation.documents[1].addressName);
    print(storeLocation.documents[1].placeName);
    print(storeLocation.documents[1].roadAddressName);

//    setState(() {
//      _names = storeLocation.documents;
//      _filteredNames = _names;
//    });

    return storeLocation.documents;
  }

//  storeCreateLocationState() {
//    searchController.addListener(() {
//      if (searchController.text.isEmpty) {
//        setState(() {});
//      } else {
//        setState(() {
//          query = searchController.text;
//        });
//      }
//    });
//  }

  void navigate() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AdRead()));
  }

//
//  Widget _buildList() {
//    if (!(query.isEmpty)) {
//      List tempList = new List();
//      for (int i = 0; i < _filteredNames.length; i++) {
//        if (_filteredNames[i]['addressName'].contains(query)) {
//          tempList.add(_filteredNames[i]);
//        }
//      }
//    }
//    return ListView.builder(
//        itemCount: _names == null ? 0 : _filteredNames.length,
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(
//            title: Text(_filteredNames[index]['addressName']),
//            onTap: () => print(_filteredNames[index]['addressName']),
//          );
//        });
//  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Text(
          '운영하고 계신 매장이 무엇입니까?',
          style: TextStyle(fontSize: 20),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(hintText: "매장 검색"),
                ),
              ),
              FlatButton(
                child: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: nowController,
                  decoration: InputDecoration(hintText: "현재 위치"),
                ),
              ),
              FlatButton(
                child: Icon(Icons.gps_fixed),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 400,
          child: FutureBuilder(
            future: getData2(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                //데이터가 있을 때
                List<Documents> storeLocation = snapshot.data;
                return ListView.builder(
                    itemCount: storeLocation.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
//                          String content = road;
//                                fireStore.collection
//                                User warn = Warn(content: content);
//                                CollectionReference warnRef = firestore.collection('Warns');
//                                var result = await warnRef.add(warn.toMap());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AdRead()));
                        },
                        child: Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:  Colors.teal,

                              ),
                            ),
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                        child: Text(
                                          '${storeLocation[index].placeName}\n'
                                              '지번 주소: ${storeLocation[index]
                                              .addressName}\n'
                                              '도로명 주소: ${storeLocation[index].roadAddressName}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(fontSize: 10),
                                          maxLines: 5,
                                        ),
                                        decoration: BoxDecoration(


                                            borderRadius:
                                            BorderRadius.only(
                                                topLeft:
                                                Radius.circular(
                                                    10.0),
                                                topRight:
                                                Radius.circular(
                                                    10.0))),

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    });
              } else {
                return Text('error');
              }
            },
          ),
        ),
//        Container(
//          margin: EdgeInsets.all(8.0),
//          child: Column(
//            children: <Widget>[
//              _createSearchView(),
//              _firstSearch ? _createListView() : _performSearch(),
//            ],
//          ),
//        ),
      ]),

      //ListView(),
    );

//
//    Column(
//        children: <Widget>[
//          Text('운영하고 계신 매장이 무엇입니까?'),
//          Row(
//            children: <Widget>[
//              TextField(),
//              FlatButton(
//                child: Icon(Icons.search),
//                onPressed: () {},
//              ),
//            ],
//          ),
//          Container(),
//          Text('$storeName'),
//          RaisedButton(
//            child: Text('다음'),
//            onPressed: () {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => AdRead()));
//            },
//          ),
//        ],
//      );
  }

//  Widget _createSearchView() {
//    return Container(
//      decoration: BoxDecoration(border: Border.all(width: 1.0)),
//      child: TextField(
//        controller: searchController,
//        decoration: InputDecoration(
//          hintText: "Search",
//          hintStyle: TextStyle(color: Colors.grey),
//        ),
//      ),
//    );
//  }
//
//  Widget _createListView() {
//    return Flexible(
//      child: ListView.builder(
//          itemCount: _names.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Card(
//              color: Colors.white,
//              elevation: 5.0,
//              child: Container(
//                margin: EdgeInsets.all(15.0),
//                child: Text("${_names[index]}"),
//              ),
//            );
//          }),
//    );
//  }
//
//  Widget _performSearch() {
//    _filteredNames = new List<String>();
//    for (int i = 0; i < _names.length; i++) {
//      var item = _names[i];
//      if (item.toLowerCase().contains(query.toLowerCase())) {
//        _filteredNames.add(item);
//      }
//    }
//    return _createFilterListView();
//  }
//
//  Widget _createFilterListView() {
//    return Flexible(
//      child: ListView.builder(
//          itemCount: _filteredNames.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Card(
//              color: Colors.white,
//              elevation: 5.0,
//              child: Container(
//                margin: EdgeInsets.all(15.0),
//                child: Text("${_filteredNames[index]}"),
//              ),
//            );
//          }),
//    );
//  }
}
