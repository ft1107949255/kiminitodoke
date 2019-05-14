import 'package:flutter/material.dart';

import 'story_data.dart';
import 'story_item.dart';
void main() => runApp(Story());

class Story extends StatefulWidget {
  @override
  _Story  createState() => new _Story();
}

class _Story extends State<Story> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: storyData.length,
        // 构造列表项
        itemBuilder: (BuildContext context, int index) {
          // 传入MessageData返回列表项
          return new StoryItem(storyData[index]);
        },
      ),
    );
  }
}