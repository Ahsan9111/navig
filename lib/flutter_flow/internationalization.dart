import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'b4vao6zc': {
      'en': 'Food & nutrition',
      'fr': '',
    },
    '3v6abu66': {
      'en': 'Clothing & other goods',
      'fr': '',
    },
    '2mjjp73j': {
      'en': 'Housing & shelters',
      'fr': '',
    },
    '2ns82q5y': {
      'en': 'Hygiene & personal care',
      'fr': '',
    },
    'qscitbke': {
      'en': 'Healthcare & medical',
      'fr': '',
    },
    'zso6y5jj': {
      'en': 'Income & financials',
      'fr': '',
    },
    'zg7zmwyj': {
      'en': 'Emergency & crisis',
      'fr': '',
    },
    'xeuijuaw': {
      'en': 'Mental health & addiction',
      'fr': '',
    },
    '0hh257nl': {
      'en': 'Childcare & parenting',
      'fr': '',
    },
    '0j8jd3lr': {
      'en': 'Justice & legal',
      'fr': '',
    },
    'vwa2x0wr': {
      'en': 'Advocacy service & care coordination',
      'fr': '',
    },
    '5iu90s45': {
      'en': 'Information & referrals or systems navigation',
      'fr': '',
    },
    'ab4qns97': {
      'en': 'Employment & work',
      'fr': '',
    },
    '6uczyil2': {
      'en': 'Language & translation',
      'fr': '',
    },
    'm1dvu4k6': {
      'en': 'Technology & communication',
      'fr': '',
    },
    'o2phwaij': {
      'en': 'Transportation',
      'fr': '',
    },
    'hvwi3f2x': {
      'en': 'Mobility & accessibility',
      'fr': '',
    },
    'swsym546': {
      'en': 'Education & training',
      'fr': '',
    },
    'ay9xkl8t': {
      'en': 'Wellness & recreation',
      'fr': '',
    },
    'p3m1gyw6': {
      'en': 'Culture & spirituality',
      'fr': '',
    },
    'oflidn7v': {
      'en': 'Pets & animals',
      'fr': '',
    },
    'm6vdztm5': {
      'en': 'Environment & nature',
      'fr': '',
    },
    'flqkhign': {
      'en': 'Other',
      'fr': '',
    },
    'yj8wx3jo': {
      'en': 'Find nearby services in your community',
      'fr': '',
    },
    'qw5z8h2i': {
      'en': 'Search by keyword',
      'fr': '',
    },
    'xbxtuds7': {
      'en': 'Grand Prairie',
      'fr': '',
    },
    'xepm451z': {
      'en': 'Sunshine Coast',
      'fr': '',
    },
    '9dgq3c1r': {
      'en': 'Choose location',
      'fr': '',
    },
    'w3jakwk9': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'khhyrsec': {
      'en': 'Search...',
      'fr': '',
    },
    'mq44k5fp': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Categorylistpage
  {
    'zjguab3w': {
      'en': 'None',
      'fr': '',
    },
    '3yvqdqzl': {
      'en': 'None',
      'fr': '',
    },
    'hi1kxt65': {
      'en': 'Youth',
      'fr': '',
    },
    'k1e1cpda': {
      'en': 'Older Adults',
      'fr': '',
    },
    '2rlacu2e': {
      'en': '2SLGBTQIA+',
      'fr': '',
    },
    'yddk779r': {
      'en': 'Indigenous',
      'fr': '',
    },
    'gt26e44c': {
      'en': 'Immigrants/Refugees',
      'fr': '',
    },
    'rn5e540m': {
      'en': 'Population Focus',
      'fr': '',
    },
    'mebtkbwc': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'kuhadl0v': {
      'en': 'Directions',
      'fr': '',
    },
    'gmhq8wbw': {
      'en': 'Search...',
      'fr': '',
    },
    '8ipiqax1': {
      'en': 'Grand Prairie',
      'fr': '',
    },
    'x5o6r54f': {
      'en': 'Sunshine Coast',
      'fr': '',
    },
    'pw0ath6g': {
      'en': 'Choose location',
      'fr': '',
    },
    'nznvdfhb': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'xkkg10jr': {
      'en': 'Home',
      'fr': '',
    },
  },
  // test
  {
    'rxs2bg2s': {
      'en': 'Grand Prairie',
      'fr': '',
    },
    '28gjobgy': {
      'en': 'Sunshine Coast',
      'fr': '',
    },
    'qdwy933q': {
      'en': 'Choose location',
      'fr': '',
    },
    'ecdazrb8': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'smm6k5ok': {
      'en': 'Search...',
      'fr': '',
    },
    'jxkna624': {
      'en': 'Hello World',
      'fr': '',
    },
    'lg29d6iy': {
      'en': 'Home',
      'fr': '',
    },
  },
  // listingPopup
  {
    'w189owl3': {
      'en': 'Description',
      'fr': '',
    },
    'mdwq9iub': {
      'en': 'Contact',
      'fr': '',
    },
    'z9dyxxjt': {
      'en': 'Directions',
      'fr': '',
    },
    'qrimpvxx': {
      'en': 'Programs',
      'fr': '',
    },
    'edjof6ys': {
      'en': 'No programs available',
      'fr': '',
    },
    'dhm7wmwk': {
      'en': 'Field is required',
      'fr': '',
    },
    'zxvfw3ux': {
      'en': 'Please enter a real name',
      'fr': '',
    },
    'oe4qc7p0': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '74fz4eml': {
      'en': 'Please enter a short desription',
      'fr': '',
    },
    'vvcjejkr': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'gdes9q6t': {
      'en': 'We have to have a URL for the project.',
      'fr': '',
    },
    'qr74uckb': {
      'en': 'Please enter a valid URL...',
      'fr': '',
    },
    'nx3a27vs': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'dio4sec5': {
      'en': 'Field is required',
      'fr': '',
    },
    'qjybhfc6': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
  },
  // emptyResultItem
  {
    'pjra8nwf': {
      'en': 'No results found',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'oiyp9onw': {
      'en': '',
      'fr': '',
    },
    '4bgom3y2': {
      'en': '',
      'fr': '',
    },
    'jjcu3dei': {
      'en': '',
      'fr': '',
    },
    'bixmqg9k': {
      'en': '',
      'fr': '',
    },
    'vwz2a1ls': {
      'en': '',
      'fr': '',
    },
    '8yyrmo3u': {
      'en': '',
      'fr': '',
    },
    'v4sco7s3': {
      'en': '',
      'fr': '',
    },
    '6jkz4ubj': {
      'en': '',
      'fr': '',
    },
    'v2yb2bnx': {
      'en': '',
      'fr': '',
    },
    'iltmq2iq': {
      'en': '',
      'fr': '',
    },
    '1f2ql86f': {
      'en': '',
      'fr': '',
    },
    'axfut8v2': {
      'en': '',
      'fr': '',
    },
    'p873ocxi': {
      'en': '',
      'fr': '',
    },
    'g6lvydzp': {
      'en': '',
      'fr': '',
    },
    'kw79ecyt': {
      'en': '',
      'fr': '',
    },
    'nrdegqfz': {
      'en': '',
      'fr': '',
    },
    'emcfpsyd': {
      'en': '',
      'fr': '',
    },
    'uzi7an6g': {
      'en': '',
      'fr': '',
    },
    'jieyv6zq': {
      'en': '',
      'fr': '',
    },
    'z7m5uant': {
      'en': '',
      'fr': '',
    },
    'sei61yin': {
      'en': '',
      'fr': '',
    },
    'y99wc7bi': {
      'en': '',
      'fr': '',
    },
    '8frcmxpv': {
      'en': '',
      'fr': '',
    },
    'fxc5is21': {
      'en': '',
      'fr': '',
    },
    '5joy7lqc': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
