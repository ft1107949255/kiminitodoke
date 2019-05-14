import 'package:flutter/material.dart';
import 'cast_data.dart';
import 'package:date_format/date_format.dart';
import '../common/touch_callback.dart';
import 'cast_content.dart';
class CastItem extends StatelessWidget {
  final CastData cast;
  CastItem(this.cast);
  void main(){
    print(this.cast);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // 底部边
        border:
        Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 64.0,
      // 按下回调处理空实现
      child: TouchCallBack(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 展示头像
            Container(
              // 头像左右留一定外边距
              margin: const EdgeInsets.only(left: 13.0, right: 13.0),
              child: Image.asset(cast.avatar, width: 48.0, height: 48.0,),
            ),
            Expanded(
              // 主标题和子标题采用垂直布局image/message_normal.png
              child: Column(
                // 垂直方向居中布局
                mainAxisAlignment: MainAxisAlignment.center,
                // 水平方向靠左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cast.name,
                    style: TextStyle(fontSize: 16.0, color:Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                  ),
                  Text(
                    cast.subTitle,
                    style: TextStyle(fontSize: 14.0, color:Color(0xFF9a9a9a)),
                    maxLines: 1,
                    // 显示不完的文本用省略号来显示
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
            return new CastContent(cast);
          }));
        },
      ),
    );
  }
}