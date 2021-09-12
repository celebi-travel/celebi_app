import 'package:celebi_project/models/place.dart';

class CitiesService {
  static final List<String> cities = allLocations.map((e) => e.city!).toList();

  static List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
