import 'package:flutter/material.dart';
import 'cast/cast.dart';
import 'story/story.dart';
import 'derivative/derivative.dart';
void main() => runApp(App(page: 0));

class App extends StatefulWidget {
  App({Key key, this.page}) : super(key: key);
  final int page;
  @override
  _MyApp  createState() => new _MyApp(this.page);
}

class _MyApp extends State<App> {
  final int page;
  var _currentIndex;
  _MyApp(this.page) {
    _currentIndex  = this.page;
  }

  // 当前选中页索引
  currentPage() {
    switch (_currentIndex) {
      case 0:
        return new Story();
      case 1:
        return new CastApp();
      case 2:
        return new Derivative();
      default:
    }
  }
  // 渲染某个菜单项，传入菜单标题，图片路径或图标
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem (
      child: Row(
        children: <Widget>[
          imagePath != null ? Image.asset(imagePath, width: 32.0, height: 32.0,) : SizedBox(width: 32.0, height: 32.0, child: Icon(icon, color: Colors.white,),),
          Container(
            padding: const EdgeInsets.only(left:20.0),
            child: Text(title, style: TextStyle(color: Colors.white),
            ) ,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      // 底部导航按钮
      bottomNavigationBar: new BottomNavigationBar(
        // 通过fixedColor设置选中的item的颜色
        type: BottomNavigationBarType.fixed,
        // 当前页面索引
        currentIndex: _currentIndex,
        // 按下后设置当前页面索引
        onTap: ((index){
          setState(() {
            _currentIndex = index;
          });
        }),
        // 底部导航按钮选项
        items: [
          new BottomNavigationBarItem(
            title:new Text(
              'ストーリー',
              style: TextStyle(
                color: _currentIndex == 0 ? Color(0xFF46c01b) : Color(0xff999999),
              ),
            ),
            // 判断当前索引做图片切换显示
            icon: _currentIndex == 0 ? Image.asset('images/icon/sawako.jpg', width: 32.0, height: 28.0,) : Image.asset('images/icon/sawako.jpg', width: 32.0, height: 28.0,),
//              backgroundColor:Colors.yellow[200]
          ),
          new BottomNavigationBarItem(
              title: new Text(
                'キャラクター',
                style: TextStyle(
                  color: _currentIndex == 1 ? Color(0xFF46c01b) : Color(0xff999999),
                ),
              ),
              icon: _currentIndex == 1 ? Image.asset('images/icon/flower.png', width: 32.0, height: 28.0,) : Image.asset('images/icon/flower.png', width: 32.0, height: 28.0,)
          ),
          new BottomNavigationBarItem(
              title: new Text(
                '周辺',
                style: TextStyle(
                  color: _currentIndex == 2 ? Color(0xFF46c01b) : Color(0xff999999),
                ),
              ),
              icon: _currentIndex == 2 ? Image.asset('images/icon/flower.png', width: 32.0, height: 28.0,) : Image.asset('images/icon/flower.png', width: 32.0, height: 28.0,)
          )
        ],
      ),

      body: currentPage(),
    );
  }
}



