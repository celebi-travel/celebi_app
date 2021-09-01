import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  late String hotelName;
  late List<dynamic> images;
  late double rating;
  late String place;
  late String description;
  late int price;
  late GeoPoint coordinate;

  Hotel({
    required this.hotelName,
    required this.images,
    required this.rating,
    required this.place,
    required this.price,
    required this.description,
    required this.coordinate,
  });

  Hotel.fromJson(Map<String, dynamic> json) {
    hotelName = json['hotelName'];
    images = json['images'];
    rating = json['rating'];
    place = json['place'];
    price = json['price'];
    description = json['description'];
    coordinate = json['coordinate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'hotelName': hotelName,
      'images': images,
      'rating': rating,
      'place': place,
      'description': description,
      'price': price,
      'coordinate': coordinate,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      hotelName: map['hotelName'],
      images: map['images'],
      rating: map['rating'],
      place: map['place'],
      description: map['description'],
      price: map['price'],
      coordinate: map['coordinate'],
    );
  }

  String toJson() => json.encode(toMap());
}
