import 'package:amap_location/amap_location.dart';
import 'package:flutter/material.dart';
//import 'package:simple_permissions/simple_permissions.dart';
import 'package:easy_alert/easy_alert.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMap createState() => new _MyMap();
}

class _MyMap extends State<MyMap> {
  var mapStr = 'xxxxxxx';
  AMapLocation _loc;
  @override
  initState() {
    AMapLocationClient.setApiKey("c1638b97299145749c46ecb47000d90f");
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
      print('xxx');
      if (!mounted) return;
      setState(() {
        _loc = loc;
      });
    });
    AMapLocationClient.startLocation();
  }

  void _checkPersmission() async {
    await AMapLocationClient.getLocation(true);
  }
  @override
  void dispose() {
    //注意这里关闭
    AMapLocationClient.shutdown();
    super.dispose();
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
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton.icon(
              onPressed: _checkPersmission,
              icon: new Icon(Icons.map),
              label: new Text('获取当前定位'),
            ),
            _loc == null
                ? new Text("")
                : new Text("定位成功:${_loc.formattedAddress}"),
          ],
        ),
      ),
    );
  }
}
