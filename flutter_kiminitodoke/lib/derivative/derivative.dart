import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/icon_item.dart';

import 'package:jaguar_cache/jaguar_cache.dart';

// 我的页面
class Derivative extends StatelessWidget {

  InMemoryCache cache=new InMemoryCache(Duration(minutes: 20));
  var username ;
  var account;
  Derivative() {
    try{
       username  = cache.read('username');
       account = cache.read('account');
    }catch(e) {
      username = '';
      account = '';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // 列表
      body: ListView(
        children: <Widget>[
          // 头像部分实现
          Container(
              margin: const EdgeInsets.only(top: 20.0),
              color: Colors.white,
              height: 80.0,
              child: TouchCallBack(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // 添加头像
                    Container(
                      margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                      child: Image.asset(
                        'images/icon/flower.png',
                        width: 70.0,
                        height: 70.0,
                      ),
                    ),
                    // 用户名及账号显示
                    Expanded(
                      child: account != ''? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         new Text(
                            username,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xFF353535),
                            ),
                          ),
                          Text(
                          'アカウント:'+  account,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFFa9a9a9),
                            ),
                          ),
                        ],
                      ): new Text('请登录'),
                      ),
                    // 二维码图片显示
                    Container(
                        margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                        child: Image.asset(
                          'images/icon/code.png',
                          width: 24.0,
                          height: 24.0,
                        )),
                  ],
                ),
                onPressed: () {
                  username == ''?
                  Navigator.pushNamed(context, '/login')
                  : print('已登录');
                },
              )),
          // 列表项
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
//            child: ImItem(
//              title: 'グッズ',
//              imagePath: 'images/icon/flower.png',
//            ),
              child: Column(
                children: <Widget>[
                  ImItem(
                    title: 'グッズ',
                    imagePath: 'images/icon/flower.png',
                   ),
                  ImItem(
                    imagePath: 'images/icon/flower.png',
                    title: 'ミュージック',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(
                      height: 0.5,
                      color: Color(0xFFd9d9d9),
                    ),
                  ),
                  ImItem(
                    imagePath: 'images/icon/flower.png',
                    title: 'ブログ',
                  ),
                  ImItem(
                    imagePath: 'images/icon/flower.png',
                    title: 'ご客サービス',
                  ),
                ],
              ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(
                      height: 0.5,
                      color: Color(0xFFd9d9d9),
                    ),
                  ),
                  ImItem(
                    imagePath: 'images/icon/flower.png',
                    title: '私の写真',
                  ),
                  ImItem(
                    imagePath: 'images/icon/flower.png',
                    title: '私のコレクション',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Divider(
                      height: 0.5,
                      color: Color(0xFFd9d9d9),
                    ),
                  ),

                ],
              )),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  title: 'メモリーのリリース',
                  imagePath: 'images/icon/flower.png',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
