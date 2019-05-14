import 'package:flutter/material.dart';
import 'singles_data.dart';
import 'singles_item.dart';

class Singles extends StatefulWidget {
  @override
  _Singles createState() => new _Singles();
}

class _Singles extends State<Singles> {
//  final GoodsData goodsData;

  List<Widget> Boxs() => List.generate(songsData.length, (index) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          height: 150.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
//              gradient: SweepGradient(colors: [Color(0xFFFFFF00), Color(0xFF00FF00), Color(0xFF00FFFF)], startAngle: 0.0, endAngle: 1*3.14),
              gradient: LinearGradient(colors: [
                Color(0x006FF111),
                Color(0xFF00FF00),
                Color(0xFF00FFFF)
              ], begin: FractionalOffset(1, 0), end: FractionalOffset(0, 1)),
              borderRadius: BorderRadius.circular(3.0)),
          child: new Row(
            children: <Widget>[
              Expanded(
                child: new Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  width: 100.0,
                  height: 150.0,
                  child: new Image.asset(
                    songsData[index].avatar,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                  child: new Container(
                    padding: const EdgeInsets.only(top: 30.0),
//                    alignment: Alignment.bottomCenter,
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          songsData[index].singer + '-' + songsData[index].name,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                        new Container(
                          width: 50.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: new Center(
                            child: GestureDetector(
                              child: new Icon(
                                Icons.play_arrow,
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (BuildContext context) {
                                      return new SinglesItem(songsData[index]);
                                    }));
                              },
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2)
            ],
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // 返回
              }),
        ),
        body: new Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/bg/flower_one.jpg'),
            fit: BoxFit.cover,
          )),
          child: new ListView(
            children: <Widget>[
              new Wrap(
                spacing: 2, //主轴上子控件的间距
                runSpacing: 5, //交叉轴上子控件之间的间距
                children: Boxs(),
              )
            ],
          ),
        ));
  }
}
