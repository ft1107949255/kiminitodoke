import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class MyPthotos extends StatefulWidget {
  @override
  _MyPthotos createState() => new _MyPthotos();
}

class _MyPthotos extends State<MyPthotos> {
//  File _image;
  File _imageFile;
  List imgList = new List<File>();
  dynamic _pickImageError;
  String _retrieveDataError;
  Future getImage() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    try {
      _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      _pickImageError = e;
    }
    if (_imageFile != null) {
      setState(() {
        imgList.add(_imageFile);
      });
    }
    print(imgList[0]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 返回
            }),
        title: new Text('私の写真'),
      ),
      body: new Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg/flower_one.jpg'),
              fit: BoxFit.cover,
            ),
            border: new Border(
              right: BorderSide(color: Colors.pink, width: 0.5),
              bottom: BorderSide(color: Colors.pink, width: 0.5),
            )),
        child: new Column(
          children: <Widget>[
            Expanded(
              child: new GestureDetector(
                  child: new Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    height: 50.0,
                    color: Colors.amber,
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Icon(
                          Icons.add,
                          size: 40.0,
                        ),
                        new Text('add photos'),
                      ],
                    ),
                  ),
                  onTap: getImage),
                flex: 1,
            ),
            Expanded(
              child:
                  imgList.length == 0 ? new Text('no photos') : getListView(),
              flex: 9,
            )
          ],
        ),
      ),
//      body: new Container(
//        decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage('images/bg/flower_one.jpg'),
//              fit: BoxFit.cover,
//            ),
//            border: new Border(
//              right: BorderSide(color: Colors.pink, width: 0.5),
//              bottom: BorderSide(color: Colors.pink, width: 0.5),
//            )),
//        child: new Row(
//            children: <Widget>[
//              Expanded(
//                child:getListView() ,
//                flex: 8,
//              ),
//              Expanded(
//                child:new Text('list') ,
//                flex: 2,
//              ),
//            ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: getImage,
//        child: Icon(Icons.add),
//      ),
    );
  }

  ListView getListView() => new ListView.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int position) {
        return Container(
          child: Image.file(
            imgList[position],
            fit: BoxFit.fitWidth,
          ),
        );
      });
}


