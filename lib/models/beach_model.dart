import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Beach {
  late String beachName;
  late List<dynamic> images;
  late String place;
  late String description;
  late GeoPoint coordinate;

  Beach({
    required this.beachName,
    required this.images,
    required this.place,
    required this.description,
    required this.coordinate,
  });

  Beach.fromJson(Map<String, dynamic> json) {
    beachName = json['beachName'];
    images = json['images'];
    place = json['place'];
    description = json['description'];
    coordinate = json['coordinate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'beachName': beachName,
      'images': images,
      'place': place,
      'description': description,
      'coordinate': coordinate,
    };
  }

  factory Beach.fromMap(Map<String, dynamic> map) {
    return Beach(
      beachName: map['beachName'],
      images: map['images'],
      place: map['place'],
      description: map['description'],
      coordinate: map['coordinate'],
    );
  }

  String toJson() => json.encode(toMap());
}
