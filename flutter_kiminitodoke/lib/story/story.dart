import 'package:flutter/material.dart';

import 'story_data.dart';
import 'story_item.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

void main() => runApp(Story());

class Story extends StatefulWidget {
  @override
  _Story createState() => new _Story();
}

class _Story extends State<Story> {
  bool isLoading = false; //是否正在请求新数据
  bool showMore = false; //是否显示底部加载中提示
  bool offState = false; //是否显示进入页面时的圆形进度条
  int page = 0;
  ScrollController scrollController = ScrollController();
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();
  Future<void> getMoreData() async {
    print('xx');
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
      page = 0;
    });
    print('下拉刷新开始,page = $page');

    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        final arr = new StoryData(
            26,
            'images/story/03/cover.jpg',
            'episode.26',
            '放课後',
            '终於可以和自己憧憬的同学自然的说早安。正当爽子正在为这件事感动的时候,这学期代理班导的副班导荒井一市(通称:阿瓶)登场了,阿瓶正想要擅自决定谁来制作出席簿时,不想看到大家困扰的爽子就举起了手…。',
            []);
        storyData.add(arr);
        print('下拉刷新结束,page = $page');
      });
    });
  }

  void getListData() {}

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('滑动到了最底部${scrollController.position.pixels}');
        setState(() {
          showMore = true;
        });
        getMoreData();  // 增加点数据
      }
    });
    getListData();   // 暂时未使用
  }

  @override
  void dispose() {
    super.dispose();
    //手动停止滑动监听
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return InnerDrawer(
        key: _innerDrawerKey,
        position: InnerDrawerPosition.end, // required
        onTapClose: true, // default false
        swipe: true, // default true
        offset: 0.6, // default 0.4
        colorTransition: Colors.yellow, // default Color.black54
        animationType: InnerDrawerAnimation
            .linear, // default static static / linear / quadratic
        innerDrawerCallback: (a) => print(a), // return bool
        child: Material(
            child: SafeArea(
                child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg/flower_one.jpg'),
                fit: BoxFit.cover,
              ),
              border: new Border(
                right: BorderSide(color: Colors.pink, width: 0.5),
                bottom: BorderSide(color: Colors.pink, width: 0.5),
              )),
          child: new Column(
            children: <Widget>[
              new Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  color: Colors.green,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      )
                    ],
                  )),
              new Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  color: Colors.green,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      )
                    ],
                  )),
              new Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  color: Colors.green,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      )
                    ],
                  )),
              new Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  color: Colors.green,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      ),
                      Expanded(
                        child: Icon(Icons.adb, color: Colors.red),
                        flex: 1,
                      )
                    ],
                  ))
            ],
          ),
        ))),
        //  A Scaffold is generally used but you are free to use other widgets
        // Note: use "automaticallyImplyLeading: false" if you do not personalize "leading" of Bar
        scaffold: Scaffold(
            body: new RefreshIndicator(
                child: isLoading == false
                    ? new ListView.builder(
                        controller: scrollController,
                        itemCount: storyData.length, //列表长度+底部加载中提示
                        itemBuilder: (BuildContext context, int index) {
                          // 传入MessageData返回列表项
                          return new StoryItem(storyData[index]);
                        },
                      )
                    : new Stack(
                        children: <Widget>[
                          new Padding(
                            padding:
                                new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
                            child: new Center(
                              child: SpinKitFadingCircle(
                                color: Colors.blueAccent,
                                size: 30.0,
                              ),
                            ),
                          ),
                          new Padding(
                            padding:
                                new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                            child: new Center(
                              child: new Text('正在加载中，莫着急哦~'),
                            ),
                          ),
                        ],
                      ),
                onRefresh: _onRefresh)));
  }

  Future<void> _onRefresh() async {
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
      page = 0;
    });

    print('下拉刷新开始,page = $page');

    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
        final arr = new StoryData(
            26,
            'images/story/03/cover.jpg',
            'episode.26',
            '放课後',
            '终於可以和自己憧憬的同学自然的说早安。正当爽子正在为这件事感动的时候,这学期代理班导的副班导荒井一市(通称:阿瓶)登场了,阿瓶正想要擅自决定谁来制作出席簿时,不想看到大家困扰的爽子就举起了手…。',
            []);
        storyData.add(arr);
        print('下拉刷新结束,page = $page');
      });
    });
  }

  void _open() {
    _innerDrawerKey.currentState.open();
  }

  void _close() {
    _innerDrawerKey.currentState.close();
  }
}
