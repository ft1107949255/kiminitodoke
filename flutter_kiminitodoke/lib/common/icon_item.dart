import 'package:flutter/material.dart';
import 'touch_callback.dart';

// 通用列表项
class ImItem extends StatelessWidget {
  // 标题
  final String title;
  // 图片路径
  final String imagePath;
  // 图标
  final Icon icon;
  ImItem({Key key, @required this.title, this.imagePath, this.icon}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TouchCallBack(
      onPressed: (){
        switch(title) {
          case 'グッズ':
            // 跳转到好友动态页面
            Navigator.pushNamed(context, '/goods');
            break;
<<<<<<< HEAD
          case '联系客服':
=======
<<<<<<< HEAD
          case '联系客服':
=======
          case 'ミュージック':
          // 跳转到单曲页面
            Navigator.pushNamed(context, '/singles');
>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
            break;
        }
      },
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            // 图标或图片
            Container(
              child: imagePath != null? Image.asset(imagePath, width: 32.0, height: 32.0,): SizedBox(height: 32.0, width: 32.0, child: icon != null ? icon: '',) ,
              margin: const EdgeInsets.only(left: 22.0, right: 20.0),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
            ),
          ],
        ),
      ),
    );
  }
}

