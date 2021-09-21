import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  final String videoURL;
  const YoutubePlayerPage({ Key? key, required this.videoURL }) : super(key: key);

  @override
  _YoutubePlayerPageState createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
late  YoutubePlayerController _controller;

  @override
  void initState() { 
    super.initState();
  _controller=  YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(widget.videoURL)!,
    flags: YoutubePlayerFlags(
        autoPlay: true, 
    ),
);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color:Colors.black,child: Center(
        child: YoutubePlayer(
    controller: _controller,
    showVideoProgressIndicator: true, 
    progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
    ),
    onReady: () { 
    },
),
      ),),
    );
  }
}            







