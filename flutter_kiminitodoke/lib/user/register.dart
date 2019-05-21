import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController username = TextEditingController();
    final TextEditingController pwd = TextEditingController();
    final TextEditingController repwd = TextEditingController();
    final TextEditingController phone = TextEditingController();
    final TextEditingController code = TextEditingController();
    void _register() {
      if (username.text.length == 0) {
        // 输入用户名
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('请输入用户名'),
                ));
        return null;
      } else if (pwd.text.length == 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('请输入密码'),
                ));
      } else if (repwd.text.length == 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('请确认密码'),
                ));
      } else {
        // 开始登陆
        if (repwd.text != pwd.text) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('密码输入不一致'),
                  ));
        }
        print('注册');
      }
    }

    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 返回
            }),
        title: new Text('注册'),
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
            margin: const EdgeInsets.only(top: 40.0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: new TextField(
                            // 绑定controller
                            controller: repwd,
                            // 最大长度
                            maxLength: 16,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.pink[100],
                              ),
                              labelText: '请确认你的密码',
                            ),
                            onChanged: _repwdFieldChanged,
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
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: new TextField(
                            // 绑定controller
                            controller: phone,
                            // 最大长度
                            maxLength: 16,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              icon: Icon(
                                Icons.phone_android,
                                color: Colors.pink[100],
                              ),
                              labelText: '请输入你的手机号',
                            ),
//                            onChanged: _repwdFieldChanged,
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
                  child: new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: new TextField(
                            // 绑定controller
                            controller: code,
                            // 最大长度
                            maxLength: 16,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              icon: Icon(
                                Icons.text_fields,
                                color: Colors.pink[100],
                              ),
                              labelText: '请输入验证码',
                            ),
//                            onChanged: _repwdFieldChanged,
                            obscureText: true),
                        flex: 6,
                      ),
                      Expanded(
                        child: new RaisedButton(
                          onPressed: _getCode,
                          child: Text('获取验证码'),
                        ),
                        flex: 3,
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
                          onPressed: _register,
                          child: Text('注册'),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: new GestureDetector(
                          onTap: () {
                            print('register');
                            Navigator.pushNamed(context, '/login');
                          },
                          child: new Text('已有账号，登录~~'),
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

  void _getCode() {
    print('xxx');
    // 请求接口 发送短信
  }

  void _usernameFieldChanged(String str) {
    print('你输入的用户名是${str}');
  }

  void _pwdFieldChanged(String str) {
    print('你输入的密码是${str}');
  }

  void _repwdFieldChanged(String str) {
    print('你再次输入的密码是${str}');
  }
}
