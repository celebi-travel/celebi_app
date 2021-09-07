import 'dart:convert';

import 'package:celebi_project/models/language_model.dart';
import 'package:celebi_project/models/tour_model.dart';

class Rehber {
  final String name;
  final String imageURL;
  final String bio;
  final double rating;
  final List<Language> languages;
  final List<Tour> tours;
  final String phoneNumber;
  final String email;
  final bool validMobilePhone;
  final bool validEmailAddress;

  Rehber(
      this.name,
      this.imageURL,
      this.bio,
      this.rating,
      this.languages,
      this.tours,
      this.phoneNumber,
      this.email,
      this.validMobilePhone,
      this.validEmailAddress);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageURL': imageURL,
      'bio': bio,
      'rating': rating,
      'languages': languages.map((x) => x.toMap()).toList(),
      'tours': tours.map((x) => x.toMap()).toList(),
      'phoneNumber': phoneNumber,
      'email': email,
      'validMobilePhone': validMobilePhone,
      'validEmailAddress': validEmailAddress,
    };
  }

  factory Rehber.fromMap(Map<String, dynamic> map) {
    return Rehber(
      map['name'],
      map['imageURL'],
      map['bio'],
      map['rating'],
      List<Language>.from(map['languages']?.map((x) => Language.fromMap(x))),
      List<Tour>.from(map['tours']?.map((x) => Tour.fromMap(x))),
      map['phoneNumber'],
      map['email'],
      map['validMobilePhone'],
      map['validEmailAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rehber.fromJson(String source) => Rehber.fromMap(json.decode(source));
}

List rehberList = [
  Rehber(
    'Azad',
    'https://pbs.twimg.com/profile_images/1422304925044854784/UpTPdQSo_400x400.jpg',
    'Yazılım Mühendisi',
    10.0,
    [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
    [Tour('Night Tour', 230, '21.00', '04:00')],
    '5416744984',
    'azadderdogan@gmail.com',
    true,
    true,
  ),
  Rehber(
      'Mirsaid',
      'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg',
      'Yazılım Mühendisi',
      10.0,
      [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
      [Tour('Night Tour', 230, '21.00', '04:00')],
      '5416744984',
      'azadderdogan@gmail.com',
      true,
      true),
  Rehber(
      'Hatice Nur',
      'https://pbs.twimg.com/profile_images/1422304925044854784/UpTPdQSo_400x400.jpg',
      'Yazılım Mühendisi',
      10.0,
      [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
      [Tour('Night Tour', 230, '21.00', '04:00')],
      '5416744984',
      'azadderdogan@gmail.com',
      true,
      true),
];
