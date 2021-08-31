import 'hotel_model.dart';

enum RoomOptions {
  standart,
  ultra,
}

extension RoomOptionExtension on RoomOptions {
  String get name {
    switch (this) {
      case RoomOptions.standart:
        return 'Standart';
      case RoomOptions.ultra:
        return 'Ultra';

      default:
        return 'null';
    }
  }
}

class HotelReservationModel {
  final Hotel hotel;

  final DateTime entryDate, releaseDate;
  final int adultNumber, childrenNumber, roomNumber;
  final RoomOptions roomOptions;

  HotelReservationModel(
      {required this.hotel,
      required this.entryDate,
      required this.releaseDate,
      required this.adultNumber,
      required this.childrenNumber,
      required this.roomNumber,
      required this.roomOptions});
}
