import 'package:flutter/material.dart';
import 'Dismessremove.dart';
import 'Dismessshow.dart';
// 我的页面
class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // 列表
      body: ListView(
        children: <Widget>[
          // 列表项
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                new GestureDetector(
                  child: new Container(
                    child: iconItem('滑动删除', 'images/icon/flower.png'),
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 50.0,
                    color: Colors.pink[200],
                  ),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                      return new Dismessremove();
                    }));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                new GestureDetector(
                  child: new Container(
                    child: iconItem('滑动显示按钮', 'images/icon/flower.png'),
                    margin: const EdgeInsets.only(top: 10.0),
                    height: 50.0,
                    color: Colors.pink[200],
                  ),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                      return new Dismessshow();
                    }));
                  },
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  iconItem(String title, [image = 'images/icon/flower.png']) {
    return new Row(
      children: <Widget>[
        Container(
          child: Image.asset(
            image,
            width: 32.0,
            height: 32.0,
          ),
          margin: const EdgeInsets.only(left: 22.0, right: 20.0),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
        ),
      ],
    );
  }
}
