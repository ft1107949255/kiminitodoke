import 'package:flutter/material.dart';
import 'loading.dart';
import 'app.dart';
import 'derivative/goods/goods.dart';
import 'derivative/singles/singles.dart';
import 'user/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,  //去除右上角的Debug标签
      title: '君に届け',
      routes: <String, WidgetBuilder>{
        '/app': (BuildContext context) => new App(page: 0) , //定义app路径
        '/goods': (BuildContext context) => new Goods() , //定义goods路径
        '/singles': (BuildContext context) => new Singles() , //定义goods_item路径
        '/login': (BuildContext context) => new MyLogin() , //定义login路径
      },
      theme: PinkTheme,
      home: new LoadingPage(),
    );
  }
}

// 定义一个喜欢的主题
final ThemeData PinkTheme = new ThemeData(
  primaryColor:Colors.pink[200],
  primaryColorBrightness: Brightness.light,
  backgroundColor: Colors.amberAccent
);
