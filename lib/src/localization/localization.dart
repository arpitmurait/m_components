class MLocalization {
  static MLocalization? _instance;

  static MLocalization get instance {
    _instance ??= MLocalization();
    return _instance!;
  }

  Map<String, Map<String, String>> _translations = {
    'en': {
      'Close': 'Close',
      'No element found': 'No element found',
      'Reset': 'Reset',
    },
    'it': {
      'Close': 'Chiudi',
      'No element found': 'Nessun elemento trovato',
      'Reset': 'Reset',
    },
  };

  String _currentLocale = 'en';

  void setLocale(String locale) {
    if (_translations.containsKey(locale)) {
      _currentLocale = locale;
    }
  }

  void setValues(Map<String, Map<String, String>> values) {
    _translations = values;
  }

  String translate(String key) {
    return _translations[_currentLocale]?[key] ?? key;
  }
}
