class PlaceModel {
  final String? imageUrl;
  bool isFavorite;
  final String? city;
  final int rate;

  PlaceModel(this.imageUrl, this.isFavorite, this.city, this.rate);
}

List<PlaceModel> nearbyLocations = [
  PlaceModel('asset/images/nearby1.png', false, 'BURSA', 2),
  PlaceModel('asset/images/nearby2.png', true, 'BALIKESİR', 3),
  PlaceModel('asset/images/nearby3.png', false, 'CANAKKALE', 2),
  PlaceModel('asset/images/nearby4.png', true, 'SAKARYA', 5),
];

List<PlaceModel> places = [
  PlaceModel('asset/images/places.png', false, 'İstanbul', 2),
  PlaceModel('asset/images/place2.png', true, 'ANTALYA', 3),
  PlaceModel('asset/images/place3.png', false, 'EDİRNE', 2),
  PlaceModel('asset/images/place4.png', true, 'TRABZON', 5),
];
