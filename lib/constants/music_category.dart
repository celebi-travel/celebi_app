enum MusicCategory { kd, ad, mr, eg }

extension path on MusicCategory {
  String get rawValue {
    switch (this) {
      case MusicCategory.kd:
        return 'kd/';
      case MusicCategory.ad:
        return 'ad/';
      case MusicCategory.mr:
        return 'mr/';
      case MusicCategory.eg:
        return 'eg/';

      default:
        throw Exception('Routes not found');
    }
  }
}
