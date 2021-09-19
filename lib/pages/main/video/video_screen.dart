import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    await Future.wait([videoPlayerController.initialize()]);

    _chewieController = ChewieController(  
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      autoInitialize: true,
      looping: true,

    );
    setState(() {});
    print(_chewieController);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.black,
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
            )),
      ),
    );
  }
}
