import 'package:flutter/material.dart';
import 'goods_data.dart';
import 'goods_item.dart';
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
class Goods extends StatefulWidget {
  @override
  _Goods createState() => new _Goods();
}

class _Goods extends State<Goods> {
//  final GoodsData goodsData;

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> flutter_kiminitodoke
  List<Widget> Boxs() => List.generate(goodsData.length - 1, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
<<<<<<< HEAD
=======
=======
  List<Widget> Boxs() => List.generate(goodsData.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (BuildContext context) {
>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
              return new GoodsItem(goodsData[index]);
            }));
          },
          child: new Container(
            width: 140,
//          height: 200,
<<<<<<< HEAD
            margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 5.0, bottom: 10.0),
=======
<<<<<<< HEAD
            margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 5.0, bottom: 10.0),
=======
            margin: const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 5.0, bottom: 10.0),
>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1.0),
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: new Column(
              children: <Widget>[
                new Image.asset(
                  goodsData[index].avatar,
                  fit: BoxFit.fitHeight,
                ),
                new Text(
                  goodsData[index].name,
                )
              ],
            ),
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> flutter_kiminitodoke
      body: new ListView(
        children: <Widget>[
          new Wrap(
            spacing: 2, //主轴上子控件的间距
            runSpacing: 5, //交叉轴上子控件之间的间距
            children: Boxs(),
          )
        ],
<<<<<<< HEAD
=======
=======
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
>>>>>>> flutter_kiminitodoke
>>>>>>> flutter_kiminitodoke
      ),
//      body: new Container(
//        child: new Row(
//          children: <Widget>[
//            Expanded(
//              child: Container(
//                child: new Text('1111'),
//                color: Colors.red, //bg color
//                padding: EdgeInsets.all(5.0),
//                height: 50.0,
//              ),
//              flex: 1,
//            ),
//            Expanded(
//              child: Container(
//                child: new Text('2222'),
//                color: Colors.blue, // bg color
//                padding: EdgeInsets.all(5.0),
//                height: 50.0,
//              ),
//              flex: 1,
//            ),
//          ],
//        ),
//      ),
    );
  }
}
