import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
}
