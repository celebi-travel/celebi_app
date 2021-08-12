class TouristicPlace {
  final String imageName, infoText, name, category;
  final int starsNumber, rateNumber;

  TouristicPlace(
      {required this.imageName,
      required this.category,
      required this.infoText,
      required this.name,
      required this.starsNumber,
      required this.rateNumber});
}

Map<String, List<TouristicPlace>> touristicPlacesFilter = {
  'Tours': touristicPlacesHotels,
  'Outdoors': touristicPlacesOutdoors,
  'History': touristicPlacesHistory,
  'Entertainment': touristicPlacesEntertainment,
};

List<TouristicPlace> touristicPlacesHotels = [
  TouristicPlace(category: 'Tours', imageName: 'asset/images/tours1.png', infoText: '', name: 'GAP Tour', starsNumber: 4, rateNumber: 25232),
  TouristicPlace(category: 'Tours', imageName: 'asset/images/tours2.png', infoText: '', name: 'Black Sea Tour', starsNumber: 3, rateNumber: 14483),
  TouristicPlace(category: 'Tours', imageName: 'asset/images/tours3.png', infoText: '', name: 'Aegean Tour', starsNumber: 2, rateNumber: 8261),
];

List<TouristicPlace> touristicPlacesHistory = [
  TouristicPlace(
      category: 'History',
      imageName: 'asset/images/history1.png',
      infoText: 'Historical Sites  Architectural Buildings  \nSultanahmet',
      name: 'Ayasofya Mosque',
      starsNumber: 4,
      rateNumber: 10110),
  TouristicPlace(
      category: 'History',
      imageName: 'asset/images/history2.png',
      infoText: 'Historical Sites  Architectural Buildings  \nSultanahmet',
      name: 'Topkapı Palace',
      starsNumber: 3,
      rateNumber: 7352),
  TouristicPlace(
      category: 'History',
      imageName: 'asset/images/history3.png',
      infoText: 'Historical Sites  Historical Museums  \nBeyoğlu',
      name: 'Galata Tower',
      starsNumber: 2,
      rateNumber: 4283),
];

List<TouristicPlace> touristicPlacesOutdoors = [
  TouristicPlace(
      category: 'Outdoors',
      imageName: 'asset/images/outdoors1.png',
      infoText: 'Forests  \nSirekci',
      name: 'Belgrad Forest',
      starsNumber: 4,
      rateNumber: 205),
  TouristicPlace(
      category: 'Outdoors',
      imageName: 'asset/images/outdoors2.png',
      infoText: 'National Parks  \nEyüp',
      name: 'Göktürk Pond National Park',
      starsNumber: 4,
      rateNumber: 127),
  TouristicPlace(
      category: 'Outdoors',
      imageName: 'asset/images/outdoors3.png',
      infoText: 'Parks \nNew City / Taksim',
      name: 'Star Park',
      starsNumber: 2,
      rateNumber: 92),
];

List<TouristicPlace> touristicPlacesEntertainment = [
  TouristicPlace(
      category: 'Entertainment',
      imageName: 'asset/images/entertainment1.png',
      infoText: 'Eyüpsultan',
      name: 'Istanbul Thema Park',
      starsNumber: 4,
      rateNumber: 584),
  TouristicPlace(
      category: 'Entertainment',
      imageName: 'asset/images/entertainment2.png',
      infoText: 'Üsküdar',
      name: 'Emaar Aquarium and Underwater Zoo',
      starsNumber: 4,
      rateNumber: 256),
  TouristicPlace(
      category: 'Entertainment',
      imageName: 'asset/images/entertainment3.png',
      infoText: 'Beyoğlu',
      name: 'Pub Crawl Istanbul',
      starsNumber: 2,
      rateNumber: 92),
];
