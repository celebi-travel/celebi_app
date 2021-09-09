import 'package:celebi_project/constants/music_category.dart';
import 'package:celebi_project/models/music_response_model.dart';
import 'package:celebi_project/models/video_response_model.dart';
import 'package:vexana/vexana.dart';

class NetworkService {
  static final String baseUrl = "https://48ad-31-223-67-205.ngrok.io/";
  INetworkManager networkManager = NetworkManager(
      options: BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },
  ));

  Future<List<MusicResponseModel>?> getMusics(
      MusicCategory musicCategory) async {
    final response =
        await networkManager.send<MusicResponseModel, List<MusicResponseModel>>(
            'media/musics/${musicCategory.rawValue}',
            parseModel: MusicResponseModel(),
            method: RequestType.GET);
    print(response.data);
    return response.data;
  }

  Future<List<VideoResponseModel>?> getVideos() async {
    final response = await networkManager
        .send<VideoResponseModel, List<VideoResponseModel>>('media/videos/',
            parseModel: VideoResponseModel(), method: RequestType.GET);
    print(response.data);
    return response.data;
  }
}
