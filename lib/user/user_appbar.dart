import 'dart:io';

import 'package:ad_store_app/ad/ad_read.dart';
import 'package:ad_store_app/store/store_read.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'menu_items.dart';

class UserAppBar extends StatefulWidget {
  @override
  _UserAppBarState createState() => _UserAppBarState();
}

class _UserAppBarState extends State<UserAppBar> {
  File _image;

  String userName= "사용자";

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      if (choice == MenuItems.adManger) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AdRead()));
      } else if (choice == MenuItems.storeManger) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => StoreRead()));
      }
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 90,
                    height: 60,
                    child: FlatButton(
                      child: _image == null? Image.asset("assets/user.png"): Image.file(_image),
                      onPressed: getGalleryImage,
                    )),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    child: FlatButton(
                      child: Text(
                        '$userName',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => StoreRead()));
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(left: 150),
                  child: PopupMenuButton<String>(
                      onSelected: choiceAction,
                      itemBuilder: (context) {
                        return MenuItems.choice.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
