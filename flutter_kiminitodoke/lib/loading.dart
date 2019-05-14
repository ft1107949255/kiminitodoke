import 'package:flutter/material.dart';
import 'dart:async';
//import 'common/loading_progess.dart';
void main() => runApp(LoadingPage());

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPage createState() => new _LoadingPage();
}

class _LoadingPage extends State<LoadingPage>  {
//  @override
//  void initState() {
//    super.initState();
//    // 加载页面停顿3s
//    new Future.delayed(Duration(seconds: 3), () {
//      print("こんにちは.....");
//      // 跳转到主页面
//      Navigator.of(context).pushReplacementNamed("/app");
//    });
//  }
   List loadingImageList = [
    'images/loading/01.jpg',
    'images/loading/02.jpg',
    'images/loading/03.jpg',
    'images/loading/04.jpg',
    'images/loading/05.jpg',
  ];
   List<Widget> widgets = [];
   Widget content;
   @override
   void initState() {
     super.initState();
     loadingImageList.map((index) {
       widgets.add(_loadingWidget(index));
     });
   }
   Widget _loadingWidget(String index) {
       return new Container(
         child: new SizedBox(
           child: Image.asset(
             index,
             fit: BoxFit.fitHeight,
           ),
         ),
       );
   }

  PageController _pageController = PageController();
  int _pageIndex = 0;
  GlobalKey<_LoadingPage> _pageIndicatorKey = GlobalKey();
  Widget _createPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (pageIndex) {
        setState(() {
          _pageIndex = pageIndex;
        });
      },
      children: <Widget>[
        new Container(
          child: new SizedBox(
            child: Image.asset(
            'images/loading/01.jpg',
            fit: BoxFit.fill,
            ),
          ),
        ),
        new Container(
          child: new SizedBox(
            child: Image.asset(
              'images/loading/02.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        new Container(
          child: new SizedBox(
            child: Image.asset(
              'images/loading/03.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        new Container(
          child: new SizedBox(
            child: Image.asset(
              'images/loading/04.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        new Container(
          child: new SizedBox(
            child: Image.asset(
              'images/loading/05.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
        new Container(
            child: new Scaffold(
              body: new Container(
                alignment: Alignment.center,
                child: new Container(
                  child: new MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text('进入app'),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/app");
                    },
                  )
                )
              )
              ),
            ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              _createPageView(),
              _createPageIndicator(),
            ],
          ),
        ));
  }
  _createPageIndicator() {
    return Opacity(
      opacity: 0.7,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 60),
          height: 40,
          width: 80,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
              color: Colors.grey, //.withAlpha(128),
              borderRadius: BorderRadius.all(const Radius.circular(6.0))),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Row(
                key: _pageIndicatorKey,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//                  new Text('1a'),
                  _dotWidget(0),
                  _dotWidget(1),
                  _dotWidget(2),
                  _dotWidget(3),
                  _dotWidget(4),
                  _dotWidget(5),
                ]),
          ),
        ),
      ),
    );
  }

  _dotWidget(int index) {
    return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (_pageIndex == index) ? Colors.white70 : Colors.black12
        )
    );
  }

}
