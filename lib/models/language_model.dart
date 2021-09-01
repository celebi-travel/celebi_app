import 'dart:convert';

class Language {
  String flagUrl;
  String language;
  Language({
    required this.flagUrl,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'flagUrl': flagUrl,
      'language': language,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      flagUrl: map['flagUrl'],
      language: map['language'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source));
}
