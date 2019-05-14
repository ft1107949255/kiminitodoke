import 'package:flutter/material.dart';
import 'cast_data.dart';
import 'cast_item.dart';
void main() => runApp(CastApp());

class CastApp extends StatefulWidget {
  @override
  _Cast  createState() => new _Cast();
}

class _Cast extends State<CastApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: castData.length,
        // 构造列表项
        itemBuilder: (BuildContext context, int index) {
          // 传入MessageData返回列表项
          return new CastItem(castData[index]);
        },
      ),
    );
  }
}