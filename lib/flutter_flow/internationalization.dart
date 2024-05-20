import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ro', 'en'];

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
    String? roText = '',
    String? enText = '',
  }) =>
      [roText, enText][languageIndex] ?? '';

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
    'co9cyfy9': {
      'ro': 'Cote Pariuri Fotbal',
      'en': 'Football Betting Odds',
    },
    '30bb6jvn': {
      'ro': 'Minimizați',
      'en': 'Minimize',
    },
    'v7p3b9g6': {
      'ro': 'Extinde',
      'en': 'Expand',
    },
    'gii5ykve': {
      'ro': 'LIGI pentru tine',
      'en': 'LEAGUES for you',
    },
    '78at51ze': {
      'ro': 'România: Liga I',
      'en': 'Romania: League I',
    },
    '5srzqziv': {
      'ro': 'România: Liga II',
      'en': 'Romania: League II',
    },
    'sr44yvcf': {
      'ro': 'UEFA Liga Campionilor',
      'en': 'UEFA Champions League',
    },
    'yypf690l': {
      'ro': 'UEFA Europa League',
      'en': 'UEFA Europa League',
    },
    'clcsf0zi': {
      'ro': 'UEFA Europa Conference League',
      'en': 'UEFA Europa Conference League',
    },
    'f5yn50dh': {
      'ro': 'Anglia: Premier League',
      'en': 'England: Premier League',
    },
    'xtufz4lk': {
      'ro': 'Germania: Bundesliga',
      'en': 'Germany: Bundesliga',
    },
    'ia1vi6lc': {
      'ro': 'Spania: La Liga',
      'en': 'Spain: La Liga',
    },
    'kpo5zp7t': {
      'ro': 'Franța: Ligue 1',
      'en': 'France: Ligue 1',
    },
    'lbx135o1': {
      'ro': 'Italia: Serie A',
      'en': 'Italy: Serie A',
    },
    '7ep2m6kp': {
      'ro': 'Olanda: Eredivisie',
      'en': 'Netherlands: Eredivisie',
    },
    'j015i2g1': {
      'ro': 'Euro 2024',
      'en': 'Euro 2024',
    },
    '9239j433': {
      'ro': 'Home',
      'en': 'Home',
    },
  },
  // MatchPage
  {
    '6ygmaj32': {
      'ro': ' vs ',
      'en': ' vs ',
    },
    'olm3q1m3': {
      'ro': '  Cote Pariuri',
      'en': ' Odds Betting',
    },
    'cnelskst': {
      'ro': 'Statistica meciului ',
      'en': 'Match statistics ',
    },
    '79x6cjep': {
      'ro': ' vs ',
      'en': ' vs ',
    },
    'dzm4uva1': {
      'ro': '  :  ',
      'en': '  :  ',
    },
    'byiqxahx': {
      'ro': ' (',
      'en': ' (',
    },
    'tr457p70': {
      'ro': '\")',
      'en': '\")',
    },
    'svw81htp': {
      'ro': ' (',
      'en': ' (',
    },
    'vgukhsr2': {
      'ro': '\")',
      'en': '\")',
    },
    'mcm59o4x': {
      'ro': 'Cele mai bune cote pentru ',
      'en': 'Best odds for ',
    },
    '70w2txnf': {
      'ro': ' vs ',
      'en': ' vs ',
    },
    'qw0so56e': {
      'ro': 'Rezultat',
      'en': 'Result',
    },
    'hwtza56a': {
      'ro': 'Cea mai bună cotă',
      'en': 'The best rate',
    },
    'zdbxw6s2': {
      'ro': 'Casă de pariuri',
      'en': 'Sportsbook',
    },
    'irmaq0eb': {
      'ro': ' să câștige',
      'en': ' to win',
    },
    'ncl0f09s': {
      'ro': 'Egalitate',
      'en': 'Equality',
    },
    'au4wlp6x': {
      'ro': ' să câștige',
      'en': ' to win',
    },
    'q09p2k2a': {
      'ro': 'Detalii meci',
      'en': 'Match details',
    },
    '5xe63fm4': {
      'ro': '-',
      'en': '-',
    },
    'k8u4q4vc': {
      'ro': ' ',
      'en': ' ',
    },
    'h188ylw7': {
      'ro': ' : ',
      'en': ' : ',
    },
    'c6vkohqc': {
      'ro': ' ',
      'en': ' ',
    },
    '5472u328': {
      'ro': '-',
      'en': '-',
    },
    'y6vc4o97': {
      'ro': 'Eveniment: ',
      'en': 'Event: ',
    },
    'bukdwm6z': {
      'ro': '-',
      'en': '-',
    },
    '1o1eajyp': {
      'ro': 'Data: ',
      'en': 'Date: ',
    },
    '7io5t1yk': {
      'ro': '-',
      'en': '-',
    },
    'bobu44lq': {
      'ro': 'Ora de începere: ',
      'en': 'Start time: ',
    },
    '1ovunrf1': {
      'ro': 'Statistici relevante pentru acest meci',
      'en': 'Relevant statistics for this match',
    },
    '98i7dh0w': {
      'ro': '-',
      'en': '-',
    },
    'ataxyifl': {
      'ro': 'În ultimul meci, ',
      'en': 'In the last match, ',
    },
    'j22efoqt': {
      'ro': 'împotriva ',
      'en': 'against ',
    },
    '2o8n67ca': {
      'ro': ', iar ',
      'en': ', and ',
    },
    'dknaydpm': {
      'ro': 'împotriva ',
      'en': 'against ',
    },
    't4eubz87': {
      'ro': '.',
      'en': '.',
    },
    'y15dqz0h': {
      'ro': '-',
      'en': '-',
    },
    'g628mz22': {
      'ro':
          ' are o performanță mai bună în ultimele 5  meciuri jucate față de ',
      'en': ' has a better performance in the last 5 matches played against ',
    },
    '0o42op6y': {
      'ro': '-',
      'en': '-',
    },
    'eukejz9x': {
      'ro': 'În ultimele 5 meciuri ',
      'en': 'In the last 5 matches ',
    },
    'c84g1u3u': {
      'ro': ' a câștigat ',
      'en': ' won ',
    },
    'mimizh7j': {
      'ro': ', iar ',
      'en': ', and ',
    },
    'wcxf3kj0': {
      'ro': ' a câștigat ',
      'en': ' won ',
    },
    'nwgtu5db': {
      'ro': '.',
      'en': '.',
    },
    'y68jx1qk': {
      'ro': '-',
      'en': '-',
    },
    'ltefym6c': {
      'ro': 'Numărul mediu de goluri în meciurile dintre ',
      'en': 'The average number of goals in the matches between ',
    },
    'en33qpx9': {
      'ro': ' și ',
      'en': ' and ',
    },
    '4guw7nss': {
      'ro': ' este de ',
      'en': ' is ',
    },
    '03ok8ofn': {
      'ro': '.',
      'en': '.',
    },
    'yb4en5dl': {
      'ro': '-',
      'en': '-',
    },
    'wxwyo31c': {
      'ro': 'În medie, ',
      'en': 'On average, ',
    },
    '7jg19flz': {
      'ro': ' marchează ',
      'en': ' scores ',
    },
    'ke6u2dig': {
      'ro': ' goluri când joacă acasă, iar ',
      'en': ' goals when playing at home, and ',
    },
    '4763ws44': {
      'ro': ' marchează ',
      'en': ' scores ',
    },
    'kza5fxga': {
      'ro': ' goluri când joacă în deplasare.',
      'en': ' scores 1.00 goals when playing away.',
    },
    'sjd7twbq': {
      'ro': '-',
      'en': '-',
    },
    'xf7wocjp': {
      'ro': 'În medie, ',
      'en': 'On average, ',
    },
    'lnuzfn7f': {
      'ro': ' marchează ',
      'en': ' scores ',
    },
    'ti54reto': {
      'ro': ' goluri într-un meci contra ',
      'en': ' goals in a match against ',
    },
    'ep2kagpj': {
      'ro': ', iar ',
      'en': ', and ',
    },
    'uqf5gwwz': {
      'ro': ' marchează ',
      'en': ' scores ',
    },
    '0zrhg77u': {
      'ro': ' goluri contra ',
      'en': ' goals against ',
    },
    'rqvhwzys': {
      'ro': '.',
      'en': '.',
    },
    '8r4qtxha': {
      'ro': '-',
      'en': '-',
    },
    't5dyuxmr': {
      'ro': 'În ultimul meci direct dintre cele două echipe, ',
      'en': 'In the last direct match between the two teams, ',
    },
    'ypfag02i': {
      'ro': ' a câștigat la o diferență de ',
      'en': ' won with a difference of ',
    },
    'npj6qstk': {
      'ro': ' goluri.',
      'en': ' goals.',
    },
    'zdwc65u2': {
      'ro': 'Echipele de start',
      'en': 'The starting teams',
    },
    'bvm9u2o9': {
      'ro': 'Home',
      'en': 'Home',
    },
  },
  // StartPage
  {
    'woq7h10i': {
      'ro': 'Home',
      'en': 'Home',
    },
  },
  // LeaguePage
  {
    'ab6e9tqv': {
      'ro': 'Minimizați',
      'en': 'Minimize',
    },
    '0ezg1uas': {
      'ro': 'Extinde',
      'en': 'Expand',
    },
    '28vt838q': {
      'ro': 'Home',
      'en': '',
    },
  },
  // SettingPage
  {
    'ohymrhg0': {
      'ro': 'Limba :',
      'en': 'Language :',
    },
    '317li8qp': {
      'ro': 'Home',
      'en': 'Home',
    },
  },
  // SitePage
  {
    'muwoqei9': {
      'ro': 'Până la 1750 LEI',
      'en': 'Up to 1750 LEI',
    },
    'hxjl39va': {
      'ro': 'Până la 500 de lei',
      'en': 'Up to 500 LEI',
    },
    'q12bivli': {
      'ro': '300 LEI Pariu fără risc + 150 de rotiri gratuite',
      'en': '300 LEI Risk-free bet + 150 free spins',
    },
    'vrozpjzh': {
      'ro': '100% până la 500 de lei',
      'en': '100% up to 500 lei',
    },
    'lb9yk26x': {
      'ro': 'Până la 550 LEI',
      'en': 'Up to 550 LEI',
    },
    'wwf5ltg7': {
      'ro': 'Home',
      'en': 'Home',
    },
  },
  // neterror
  {
    'sxvdc34b': {
      'ro': 'Eroare de rețea',
      'en': 'Network error',
    },
  },
  // navbar
  {
    '4v3rai5f': {
      'ro': 'ACASĂ',
      'en': 'HOME',
    },
    '8txvppv4': {
      'ro': 'ACASĂ',
      'en': 'HOME',
    },
    'f8t45btn': {
      'ro': 'Pariuri',
      'en': 'BET',
    },
    'qz8jnl4s': {
      'ro': 'Pariuri',
      'en': 'BET',
    },
    'sdhi3s06': {
      'ro': 'SETARI',
      'en': 'SETTING',
    },
    'p2fsv170': {
      'ro': 'SETARI',
      'en': 'SETTING',
    },
  },
  // footer
  {
    '50uhno5w': {
      'ro': 'COPYRIGHT © 2024 COTE-PARIURI.RO',
      'en': 'COPYRIGHT © 2024 COTE-PARIURI.RO',
    },
    'qm30uypr': {
      'ro': '18+ | Site-ul este interzis minorilor',
      'en': '18+ | Site is prohibited for minors',
    },
    'kyvna2jb': {
      'ro': 'Decizia ONJN Nr. 353/26.02.2020',
      'en': 'ONJN decision No. 353/26.02.2020',
    },
  },
  // Miscellaneous
  {
    've0viif1': {
      'ro': 'Alerte despre meciurile alese?',
      'en': '',
    },
    '6qfg5qq0': {
      'ro': '',
      'en': '',
    },
    'ot3ru25b': {
      'ro': '',
      'en': '',
    },
    'jgaf51iz': {
      'ro': '',
      'en': '',
    },
    '8h7t9555': {
      'ro': '',
      'en': '',
    },
    'l1dxcsz3': {
      'ro': '',
      'en': '',
    },
    'hc28rfyz': {
      'ro': '',
      'en': '',
    },
    '8sodec1n': {
      'ro': '',
      'en': '',
    },
    'hsrasxus': {
      'ro': '',
      'en': '',
    },
    'fzzzq3vl': {
      'ro': '',
      'en': '',
    },
    'giktozl1': {
      'ro': '',
      'en': '',
    },
    'x33ajg0p': {
      'ro': '',
      'en': '',
    },
    'dcealv3o': {
      'ro': '',
      'en': '',
    },
    '35njb5f2': {
      'ro': '',
      'en': '',
    },
    'xvil4hx3': {
      'ro': '',
      'en': '',
    },
    '33q8h59n': {
      'ro': '',
      'en': '',
    },
    'sqdll3m3': {
      'ro': '',
      'en': '',
    },
    '4ut8ggu9': {
      'ro': '',
      'en': '',
    },
    'myw5qb6v': {
      'ro': '',
      'en': '',
    },
    '8p88z15v': {
      'ro': '',
      'en': '',
    },
    'gxwpum20': {
      'ro': '',
      'en': '',
    },
    '70p372mc': {
      'ro': '',
      'en': '',
    },
    'e0ldw9xi': {
      'ro': '',
      'en': '',
    },
    'ik2unv6r': {
      'ro': '',
      'en': '',
    },
    'z3dr24c2': {
      'ro': '',
      'en': '',
    },
    'nnuozik2': {
      'ro': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
