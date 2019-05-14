import 'package:flutter/material.dart';
import 'story_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
import 'video_player_item.dart';

>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
//import 'dart:math';
class StoryContent extends StatefulWidget {
  final StoryData story;
  StoryContent(this.story);
//  StoryContent({Key key}) : super(key: key);
  @override
  _StoryContent createState() => new _StoryContent(story);
}
class _StoryContent extends State<StoryContent> {
  // 获取参数story
  final StoryData story;
  _StoryContent(this.story);
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======


//  _StoryContent(this.controller);
>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
  String  number = '124';
  String  defaultIcon = '0';
  void main() {
    print(1);
  }
  void _change() {
    setState(() {
      number = defaultIcon == '0'? (int.parse(number) + 1).toString(): (int.parse(number) - 1).toString();
      defaultIcon = defaultIcon == '0' ? '1': '0';
    });
    print(story.imageList);
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        leading:
            IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 返回
            }
        ),
      ),
      body: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg/flower_one.jpg'),
              fit: BoxFit.cover,
            )),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Text(
                story.title + story.subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            new Container(
             decoration: new BoxDecoration(
                border: new Border.all(width: 1.0, color: Colors.pink),
                color: Colors.grey,
                borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
              ),
              width: ScreenUtil().setWidth(700),
              child: story.imageList.length != 0 ? new CarouselSlider(
                  items: story.imageList.map((i) {
                    return  new Builder(
                      builder: (BuildContext context) {
                        return new Container(
                            width:  MediaQuery.of(context).size.width ,
//                            margin: new EdgeInsets.only(left: 0, right: 1.0),
                            decoration: new BoxDecoration(
                                color: Colors.amber
                            ),
                            child:  new Image.asset(
                              i,
                              fit: BoxFit.fill,
                            ),
                        );
                      },
                    );
                  }).toList(),
                  height: 180.0,
                  autoPlay: false
              ) : Image.asset(story.image, fit:BoxFit.fill),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(700),
              child: Text(
                  story.description,
                  style: TextStyle(
                      letterSpacing: 2.0,
//                      wordSpacing: 15.0,
                  ),

              ),
            ),
            // 收藏
            new Container(
              margin: const EdgeInsets.only(top: 4.0, bottom: 10.0),
              alignment: Alignment.bottomCenter,
              width: ScreenUtil().setWidth(700),
              child: new Row(
                  children: <Widget>[
                    new IconButton(
                      icon: defaultIcon == '0' ? const Icon(Icons.favorite_border, color: Colors.red) : const Icon(Icons.favorite, color: Colors.red),
                      onPressed: _change,
                    ),
                    new Text(
                      number.toString(),
                    ),
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
                    new Container(
                      width: 30.0,
                      height: 30.0,
                      margin: const EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: new Center(
                        child: GestureDetector(
                          child: new Icon(
                            Icons.play_arrow,
                          ),
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (BuildContext context) {
                                  return new VideoPlayer(story);
                                }));
                          },
                        ),

                      ),
                    )
>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
                  ],
              ),
            )
          ],
        ),
      ),
    );
  }
}