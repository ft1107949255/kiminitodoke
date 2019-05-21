import 'package:flutter/material.dart';
import 'register.dart';
import '../derivative/derivative.dart';
import '../app.dart';
class MyLogin extends StatefulWidget {
  @override
  __MyLogin createState() => new __MyLogin();
}

class __MyLogin extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController pwd = TextEditingController();
    void _login() {
      if (username.text.length == 0) {
        // 输入用户名
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('请输入用户名'),
                ));
      } else if (pwd.text.length == 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('请输入密码'),
                ));
      } else {
        // 开始登陆
        print('登录');
      }
    }

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
//              Navigator.pop(context); // 返回

              Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                return new App(page: 2);
              }));
            }),
        title: new Text('登录'),
      ),
      body: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/bg/flower_one.jpg'),
          fit: BoxFit.cover,
        )),
        child: new Center(
          child: new Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new TextField(
                          // 绑定controller
                          controller: username,
                          // 最大长度
                          maxLength: 16,
                          //输入类型
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.pink[100],
                            ),
                            labelText: '请输入你的用户名',
                          ),
                          onChanged: _usernameFieldChanged,
                          autofocus: false,
                        ),
                        flex: 8,
                      ),
                      Expanded(
                        child: new Text(''),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                new Container(
                  child: new Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: new TextField(
                            // 绑定controller
                            controller: pwd,
                            // 最大长度
                            maxLength: 16,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.pink[100],
                              ),
                              labelText: '请输入你的密码',
                            ),
                            onChanged: _pwdFieldChanged,
                            obscureText: true),
                        flex: 8,
                      ),
                      Expanded(
                        child: new Text(''),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                new Container(
//                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.only(left: 40.0),
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          onPressed: _login,
                          child: Text('登录'),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: new GestureDetector(
                          onTap: (){
                            print('register');
                            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                              return new Register();
                            }));
                          },
                          child: new Text('没有账号，注册~~'),
                        ),
                        flex: 6,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _usernameFieldChanged(String str) {
    print('你输入的用户名是${str}');
  }

  void _pwdFieldChanged(String str) {
    print('你输入的密码是${str}');
  }
}
