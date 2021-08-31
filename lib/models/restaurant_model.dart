import 'dart:convert';

class Restaurant {
  final String name;
  final List<String> imageUrls;
  final double rating;
  final String place;

  Restaurant(this.name, this.imageUrls, this.rating, this.place);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrls': imageUrls,
      'rating': rating,
      'place': place,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      map['name'],
      List<String>.from(map['imageUrls']),
      map['rating'],
      map['place'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source));
}
