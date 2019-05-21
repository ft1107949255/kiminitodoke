import 'package:flutter/material.dart';
import 'goods_data.dart';
import 'goods_item.dart';

class Goods extends StatefulWidget {
  @override
  _Goods createState() => new _Goods();
}

class _Goods extends State<Goods> {
//  final GoodsData goodsData;

  List<Widget> Boxs() => List.generate(goodsData.length - 1, (index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
              return new GoodsItem(goodsData[index]);
            }));
          },
          child: new Container(
            width: 140,
            margin: const EdgeInsets.only(left: 20.0, right: 10.0, top: 5.0, bottom: 10.0),
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
      ),
    );
  }
}
