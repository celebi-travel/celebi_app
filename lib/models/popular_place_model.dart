class PopularPlaceModel {
  final String? imageUrl;
  final String? placeName;
  bool isFavorite;
  final String? city;
  final int rate;
  final String videoUrl;

  PopularPlaceModel(this.imageUrl, this.placeName, this.isFavorite, this.city,
      this.rate, this.videoUrl);
}

List<PopularPlaceModel> popularPlaces = [
  PopularPlaceModel(
    'https://images.bursadabugun.com/galeriler/2018/11/13/51618-istanbul-fotograflari-5beab9ce01b88.jpg',
    'Topkapı',
    false,
    'İstanbul',
    2,
    'https://www.youtube.com/watch?v=0ZbHUv2TFRA',
  ),
  PopularPlaceModel(
    'https://www.yaz-tatili.com/wp-content/uploads/Fethiye-Marina.jpg',
    'Fethiye',
    false,
    'Muğla',
    2,
    'https://www.youtube.com/watch?v=BmG4pTnjBm4',
  ),
  PopularPlaceModel(
    'https://www.tatildekirala.com/blog/wp-content/uploads/2020/12/izmirr.png',
    'Kordon',
    false,
    'İzmir',
    2,
    'https://www.youtube.com/watch?v=1MV3fx6Rvgw',
  ),
  PopularPlaceModel(
    'http://eseksutuneredebulunur.com/img/konya.jpg',
    'Mevlana',
    false,
    'Konya',
    2,
    'https://www.youtube.com/watch?v=J6yYIVKy36s',
  ),
  PopularPlaceModel(
    'https://pbs.twimg.com/media/BKKQBGoCcAAAQsi.jpg',
    'Peri Bacaları',
    false,
    'Nevşehir',
    2,
    'https://www.youtube.com/watch?v=f3lv65BFmaA&t=0s',
  ),
  PopularPlaceModel(
    'https://i.pinimg.com/564x/18/9a/e3/189ae318ce00f2335dc32ed40f374b48.jpg',
    'Alanya',
    false,
    'Antalya',
    2,
    'https://www.youtube.com/watch?v=Qqt-7ktg6Ws',
  ),
  PopularPlaceModel(
    'https://i2.cnnturk.com/i/cnnturk/75/800x400/5ef9fe05bf214411e0bbf192',
    'Mardin',
    false,
    'Mardin',
    2,
    'https://www.youtube.com/watch?v=3KPbAvR9IAs',
  ),
];
