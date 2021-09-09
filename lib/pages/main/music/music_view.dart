import 'package:audioplayers/audioplayers.dart';
import 'package:celebi_project/constants/music_category.dart';
import 'package:celebi_project/models/music_response_model.dart';
import 'package:celebi_project/services/network_service.dart';
import '../../../extensions/context_extension.dart';
import 'custom_list_tile.dart';
import 'music_model.dart';
import 'package:flutter/material.dart';

class MusicView extends StatefulWidget {
  const MusicView({Key? key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  MusicResponseModel? currentMusic;
  IconData playPauseIcon = Icons.play_arrow;
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  List<MusicResponseModel>? musicList = [];
  late NetworkService networkService;git 
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  void initState() {
    super.initState();
    networkService = NetworkService();
    networkService.getMusics(MusicCategory.kd).then((value) {
      musicList = value;
      setState(() {
        currentMusic = musicList!.first;
      });
    });
  }

  Duration duration = Duration();
  Duration position = Duration();
  Future<void> playMusic(MusicResponseModel musicModel) async {
    if (isPlaying && currentMusic!.url != musicModel.url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(musicModel.url!);
      if (result == 1) {
        setState(() {
          currentMusic = musicModel;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(musicModel.url!);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Anadolu Playlist',
          style: context.textTheme.headline5,
        ),
        elevation: 0,
      ),
      body: musicList!.length == 0
          ? CircularProgressIndicator()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: musicList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomListTile(
                        music: musicList![index],
                        onTap: () {
                          playMusic(musicList![index]);
                          setState(() {
                            currentMusic = musicList![index];
                          });
                        },
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Color(0x55212121), blurRadius: 8),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: Column(
                    children: [
                      Slider.adaptive(
                        value: position.inSeconds.toDouble(),
                        min: 0,
                        max: duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          setState(() async {
                            await audioPlayer
                                .seek(Duration(seconds: value.toInt()));
                            position = Duration(milliseconds: value.toInt());
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8, left: 12, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: AssetImage('asset/images/logo.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentMusic!.musicName!,
                                    style: context.textTheme.bodyText1,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    currentMusic!.singerName!,
                                    style: context.textTheme.bodyText2,
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isPlaying) {
                                    audioPlayer.pause();
                                    setState(() {
                                      playPauseIcon = Icons.pause;
                                      isPlaying = false;
                                    });
                                  } else {
                                    audioPlayer.resume();
                                    setState(() {
                                      playPauseIcon = Icons.play_arrow;
                                      isPlaying = true;
                                    });
                                  }
                                });
                              },
                              icon: Icon(playPauseIcon),
                              iconSize: 42,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
