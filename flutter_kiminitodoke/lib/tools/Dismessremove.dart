import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Dismessremove extends StatelessWidget {
  final title = '滑动删除';
  final List<String> items  =  new List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // 返回
            }),
        title: new Text(title),
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return new Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: new Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: new Container(color: Colors.red),
            child: new ListTile(title: new Text('$item'),),
          );
        },
      ),
    );
  }
}
