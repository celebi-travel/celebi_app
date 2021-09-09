import 'package:vexana/vexana.dart';

class VideoResponseModel extends INetworkModel<VideoResponseModel> {
  int? id;
  String? place;
  String? city;
  String? image;
  String? video;

  VideoResponseModel({this.id, this.place, this.city, this.image, this.video});

  VideoResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    place = json['place'];
    city = json['city'];
    image = json['image'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['place'] = this.place;
    data['city'] = this.city;
    data['image'] = this.image;
    data['video'] = this.video;
    return data;
  }

  @override
  VideoResponseModel fromJson(Map<String, dynamic> json) {
    return VideoResponseModel.fromJson(json);
  }

  @override
  String toString() {
    return 'VideoResponseModel(id: $id, place: $place, city: $city, image: $image, video: $video)';
  }
}
