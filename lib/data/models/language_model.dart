class LanguageEntity {
  final String code;
  final String value;

  const LanguageEntity({
    required this.code,
    required this.value,
  });
}

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'vi', value: 'VietNam'),
    LanguageEntity(code: 'en', value: 'English'),
  ];
}