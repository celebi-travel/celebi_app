class PlaceModel {
  final String? imageUrl;
  bool isFavorite;
  final String? city;
  final int rate;

  PlaceModel(this.imageUrl, this.isFavorite, this.city, this.rate);
}

List<PlaceModel> nearbyLocations = [
  PlaceModel(
      'https://www.nkfu.com/wp-content/uploads/2017/01/bursa-ulu-cami.jpg',
      false,
      'BURSA',
      2),
  PlaceModel('http://www.azgezmis.com/uploads/otel-fiyatlari-800x534.jpg', true,
      'BALIKESİR', 3),
  PlaceModel(
      'https://www.ulutour.com.tr/inc/dosyalar/page_165/img/1514291096-1.jpg',
      false,
      'CANAKKALE',
      2),
  PlaceModel(
      'https://www.yaz-tatili.com/wp-content/uploads/sakarya-gezilecek-yerler-1.jpg',
      true,
      'SAKARYA',
      5),
];

List<PlaceModel> places = [
  PlaceModel(
      'https://www.dreamofholiday.com/userFiles/bolgeler/950205793_1588435982.jpg',
      false,
      'İSTANBUL',
      2),
  PlaceModel(
      'https://kulturveyasam.com/wp-content/uploads/2018/05/antalya_sahil_ilcesi-09-min.jpg',
      true,
      'ANTALYA',
      3),
  PlaceModel(
      'https://i2.milimaj.com/i/milliyet/75/0x410/5c8e6b1445d2a02a34e7c9f4.jpg',
      false,
      'EDİRNE',
      2),
  PlaceModel(
      'https://blog.biletbayi.com/wp-content/uploads/2020/03/trabzon-turkiye-scaled.jpg',
      true,
      'TRABZON',
      5),
];

List<PlaceModel> allLocations = [
  PlaceModel(
      'https://www.nkfu.com/wp-content/uploads/2017/01/bursa-ulu-cami.jpg',
      false,
      'BURSA',
      2),
  PlaceModel('http://www.azgezmis.com/uploads/otel-fiyatlari-800x534.jpg', true,
      'BALIKESİR', 3),
  PlaceModel(
      'https://www.ulutour.com.tr/inc/dosyalar/page_165/img/1514291096-1.jpg',
      false,
      'CANAKKALE',
      2),
  PlaceModel(
      'https://www.yaz-tatili.com/wp-content/uploads/sakarya-gezilecek-yerler-1.jpg',
      true,
      'SAKARYA',
      5),
  PlaceModel(
      'https://www.dreamofholiday.com/userFiles/bolgeler/950205793_1588435982.jpg',
      false,
      'İSTANBUL',
      2),
  PlaceModel(
      'https://kulturveyasam.com/wp-content/uploads/2018/05/antalya_sahil_ilcesi-09-min.jpg',
      true,
      'ANTALYA',
      3),
  PlaceModel(
      'https://i2.milimaj.com/i/milliyet/75/0x410/5c8e6b1445d2a02a34e7c9f4.jpg',
      false,
      'EDİRNE',
      2),
  PlaceModel(
      'https://blog.biletbayi.com/wp-content/uploads/2020/03/trabzon-turkiye-scaled.jpg',
      true,
      'TRABZON',
      5),
];
