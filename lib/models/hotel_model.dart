import 'dart:convert';

class Hotel {
  final String hotelName;
  final List<String> images;
  final double rating;
  final String place;
  final String description;
  final int price;

  Hotel(
       this.hotelName,
 this.images,
 this.rating,
 this.place,
 this.price,
 this.description);

  Map<String, dynamic> toMap() {
    return {
      'hotelName': hotelName,
      'images': images,
      'rating': rating,
      'place': place,
      'description': description,
      'price': price,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      map['hotelName'],
      List<String>.from(map['images']),
      map['rating'],
      map['place'],
      map['description'],
      map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) => Hotel.fromMap(json.decode(source));
}
