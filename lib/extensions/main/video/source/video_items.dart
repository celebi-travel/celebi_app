import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  const VideoItems(
      {required this.videoPlayerController,
      required this.looping,
      required this.autoplay,
      Key? key})
      : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        aspectRatio: 5 / 10,
        materialProgressColors: ChewieProgressColors(
            backgroundColor: Colors.red, bufferedColor: Colors.red),
        videoPlayerController: widget.videoPlayerController,
        looping: widget.looping,
        autoPlay: widget.autoplay,
        autoInitialize: true);
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }
}
