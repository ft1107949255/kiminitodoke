import 'package:flutter/material.dart';
import 'cast_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CastContent extends StatefulWidget{
  final CastData cast;
  CastContent(this.cast);
  @override
  _CastContent createState() => new _CastContent(cast);
}

class _CastContent extends State<CastContent> {
  final CastData cast;
  _CastContent(this.cast);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading:
        IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 返回
            }
        ),
      ),
      body: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg/flower_one.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              cast.descriptionImg
            ),
            new Text(
              ''
            ),
          ],
        ),
      ),
    );
  }
}