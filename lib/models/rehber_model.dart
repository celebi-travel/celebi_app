import 'dart:convert';

import 'language_model.dart';
import 'tour_model.dart';

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
    'Malik Budak',
    'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg',
    'I was born in 1993 in Istanbul. I graduated from Boğaziçi University, Department of History in 2018. I have been working as a tourist guide with a cockpit since January 2021. I have traveled many times abroad and especially in Europe. I have fluent English speaking skills. Intermediate German and...',
    10.0,
    [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
    [Tour('Night Tour', 230, '21.00', '04:00')],
    '5416744984',
    'azadderdogan@gmail.com',
    true,
    true,
  ),
  Rehber(
      'Afşın Dalgıç',
      'https://pbs.twimg.com/profile_images/927275814026203141/mTLFXflg.jpg',
      'My name is Afşın Dalgıç and I was born on Jan 20th. I grew up in one of the most beautiful cities in Turkey: Istanbul, historically also called Smyrna. Since the early childhood I always enjoyed travelling and exploring the ancient civilisations all around Turkey and the world. I studied English and...',
      10.0,
      [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
      [Tour('Night Tour', 230, '21.00', '04:00')],
      '5416744984',
      'azadderdogan@gmail.com',
      true,
      true),
  Rehber(
      'Lale Smith',
      'https://organicthemes.com/demo/profile/files/2018/05/profile-pic.jpg',
      "I have returned to Turkey after living in the UK for 10 years. I have many years working in the retail industry and also ran my own successful beauty therapy business. I have lots of experience interacting with customers and I'm fluent in english, farsi, Azeri and Turkish. I would now like to...",
      10.0,
      [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
      [Tour('Night Tour', 230, '21.00', '04:00')],
      '5416744984',
      'azadderdogan@gmail.com',
      true,
      true),
  Rehber(
      'Uluç Ali Fidan',
      'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
      "Hi! I am a professional tour guide. (English/Turkish). I'm living in Istanbul. What I offer: -Private tour in Izmir, Ephesus, Pergamon -Private tour in Istanbul -Private tour in Denizli, Pamukkale we can also work on the destinations together for your planned trip to Turkey.",
      10.0,
      [Language(flagUrl: 'bayrak_url', language: 'Türkçe')],
      [Tour('Night Tour', 230, '21.00', '04:00')],
      '5416744984',
      'azadderdogan@gmail.com',
      true,
      true),
];
