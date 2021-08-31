import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  late String restaurantName;
  late List<dynamic> images;
  late double rating;
  late String place;
  late GeoPoint coordinate;

  Restaurant({
    required this.restaurantName,
    required this.images,
    required this.rating,
    required this.place,
    required this.coordinate,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    restaurantName = json['name'];
    images = json['imageUrls'];
    rating = json['rating'];
    place = json['place'];
    coordinate = json['coordinate'];
  }
}
