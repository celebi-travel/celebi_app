import 'dart:convert';

class Tour {
  final String tourName;
  final int price;
  final String startTime;// "04:34"
  final String endTime;

  Tour(this.tourName, this.price, this.startTime, this.endTime);


  Map<String, dynamic> toMap() {
    return {
      'tourName': tourName,
      'price': price,
      'endTime': endTime,
    };
  }

  factory Tour.fromMap(Map<String, dynamic> map) {
    return Tour(
      map['tourName'],
      map['price'],
      map['startTime'],
      map['endTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tour.fromJson(String source) => Tour.fromMap(json.decode(source));
}

