class PlaceModel {
  final String? imageUrl;
  final String? placeName;
  bool isFavorite;
  final String? city;
  final int rate;

  PlaceModel(
      this.imageUrl, this.placeName, this.isFavorite, this.city, this.rate);
}

List<PlaceModel> nearbyLocations = [
  PlaceModel('asset/images/nearby1.png', 'Topkapı', false, 'İstanbul', 2),
  PlaceModel('asset/images/nearby2.png', 'Peri Bacaları', true, 'Nevşehir', 3),
  PlaceModel('asset/images/nearby3.png', 'Delikli Taş', false, 'Erzincan', 2),
  PlaceModel('asset/images/nearby4.png', 'Uludağ', true, 'Bursa', 5),
  PlaceModel('asset/images/nearby5.png', 'Saray', true, 'İstanbul', 2),
];

List<PlaceModel> places = [
  PlaceModel('asset/images/places.png', 'Topkapı', false, 'İstanbul', 2),
  PlaceModel('asset/images/place2.png', 'Peri Bacaları', true, 'Nevşehir', 3),
  PlaceModel('asset/images/place3.png', 'Delikli Taş', false, 'Erzincan', 2),
  PlaceModel('asset/images/place4.png', 'Uludağ', true, 'Bursa', 5),
  PlaceModel('asset/images/places.png', 'Topkapı', false, 'İstanbul', 2),
  PlaceModel('asset/images/place2.png', 'Peri Bacaları', true, 'Nevşehir', 3),
  PlaceModel('asset/images/place3.png', 'Delikli Taş', false, 'Erzincan', 2),
  PlaceModel('asset/images/place4.png', 'Uludağ', true, 'Bursa', 5),
];
