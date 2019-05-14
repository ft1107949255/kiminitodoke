//import 'chewie_list_item.dart;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'chewie_list_item.dart';
import 'story_data.dart';

class VideoPlayer extends StatelessWidget {
  final StoryData story;
  VideoPlayer(this.story);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // 关闭视频
//                _ChewieListItemState.dispose();
                Navigator.pop(context); // 返回
              }),
          title: Text(story.title),
        ),
        body: new Container(
          margin: const EdgeInsets.only(top: 0.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/bg/flower_one.jpg'),
            fit: BoxFit.cover,
          )),
          child: new Column(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: ChewieListItem(
                  videoPlayerController: VideoPlayerController.asset(
                    'videos/01.MP4',
                  ),
                  looping: true,
                ),
              ),

            ]
          )
        ));
  }
}
