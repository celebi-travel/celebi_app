import 'package:celebi_project/pages/main/video/source/video_items.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: VideoItems(
                videoPlayerController: VideoPlayerController.asset(""),
                looping: true,
                autoplay: true),
          ),
        ),
      ),
    );
  }
}
