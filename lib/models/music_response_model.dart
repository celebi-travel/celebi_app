import 'package:vexana/vexana.dart';

class MusicResponseModel extends INetworkModel<MusicResponseModel> {
  int? id;
  String? category;
  String? musicName;
  String? singerName;
  String? url;

  MusicResponseModel(
      {this.id, this.category, this.musicName, this.singerName, this.url});

  MusicResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    musicName = json['music_name'];
    singerName = json['singer_name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['music_name'] = this.musicName;
    data['singer_name'] = this.singerName;
    data['url'] = this.url;
    return data;
  }

  @override
  MusicResponseModel fromJson(Map<String, dynamic> json) {
    return MusicResponseModel.fromJson(json);
  }

  @override
  String toString() {
    return 'MusicResponseModel(id: $id, category: $category, musicName: $musicName, singerName: $singerName, url: $url)';
  }
}
