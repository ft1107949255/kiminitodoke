import 'package:flutter/material.dart';
import 'goods_data.dart';

class GoodsItem extends StatefulWidget {
  final GoodsData goods;
  GoodsItem(this.goods);
  @override
  _GoodsItem createState() => new _GoodsItem(goods);
}

class _GoodsItem extends State<GoodsItem> {
  final GoodsData goods;
  _GoodsItem(this.goods);
  @override
  Widget build(BuildContext context) {
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
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/bg/flower_one.jpg'),
          fit: BoxFit.cover,
        )),
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new Image.asset(goods.avatar),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          width: 100.0,
                          color: Colors.blue,
                          child: new Text(goods.name,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        new Container(
                          margin: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          width: 100.0,
                          color: Colors.blue,
                          child: new Text(goods.description,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        new Container(
                          margin: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          width: 100.0,
                          color: Colors.blue,
                          child: new Text(goods.price+ '円',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  flex: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

