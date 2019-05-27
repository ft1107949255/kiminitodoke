import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Dismessshow extends StatefulWidget {
  @override
  _Dismessshow createState() => _Dismessshow();
}

class _Dismessshow extends State<Dismessshow> {
  final title = '滑动显示';
//  final List<String> items  =  [
//    '1','2'
//  ];
//  final List<Map> items  =  [
//    {'name': 'xxx', 'show': false}
//  ];
  final List<Map> items = new List<Map>.generate(20, (i) {
    return {'name': 'item${i}', 'show': false};
  });
  change(index) {
    print('xxx');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 返回
            }),
        title: new Text(title),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return new GestureDetector(
//              onHorizontalDragStart:(startDetails){},
            onHorizontalDragEnd: (endDetails) {
              // 怎么判断方向还是个问题
              setState(() {
                items[index]['show'] =
                    items[index]['show'] == true ? false : true;  // items[index]['show']!= items[index]['show'] 这样不行为啥
              });
            },
            child: new Container(
              height: 40.0,
//              color: Colors.amber,
              padding: const EdgeInsets.only(left: 10.0),
              decoration: new BoxDecoration(
                  border: new Border(
                bottom: BorderSide(color: Colors.amber, width: 0.5),
              )),
              child: new Row(
                children: <Widget>[
                  item['show'] == true
                      ? new RaisedButton(
                          child: new Text('remove'),
                          onPressed: () {
                            print('click');
                            setState(() {
                              items.removeAt(index);
                            });
                            Scaffold.of(context).showSnackBar(
                                new SnackBar(content: new Text('${item["name"]} is dismissed')));
                          },
                          color: Colors.yellow,
                          splashColor: Colors.pink[100])
                      : new Text(''),
                  new Text(item['name'])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
