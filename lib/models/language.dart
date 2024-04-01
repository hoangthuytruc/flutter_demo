enum Language { vietnamese, english, }

extension LanguageExtension on Language {
  String get viValue {
    switch (this) {
      case Language.vietnamese: return "Tiếng Việt";
      case Language.english: return "Tiếng Anh";
    }
  }

  String get enValue {
    switch (this) {
      case Language.vietnamese: return "Vietnamese";
      case Language.english: return "English";
    }
  }
}