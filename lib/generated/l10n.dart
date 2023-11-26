// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Example App`
  String get title {
    return Intl.message(
      'Flutter Example App',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Please rate the app`
  String get rateUs {
    return Intl.message(
      'Please rate the app',
      name: 'rateUs',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Rate us on AppStore!`
  String get rateUsAppStore {
    return Intl.message(
      'Rate us on AppStore!',
      name: 'rateUsAppStore',
      desc: '',
      args: [],
    );
  }

  /// `LET'S`
  String get lets {
    return Intl.message(
      'LET\'S',
      name: 'lets',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: '',
      args: [],
    );
  }

  /// `NEW MODS`
  String get newMods {
    return Intl.message(
      'NEW MODS',
      name: 'newMods',
      desc: '',
      args: [],
    );
  }

  /// `Explore awesome Minecraft mods! Our vast selection of mods will enhance your gaming experience. Quickly find the best mods for your playstyle with our easy search feature. Play Minecraft with new adventures today!`
  String get modsAwesome {
    return Intl.message(
      'Explore awesome Minecraft mods! Our vast selection of mods will enhance your gaming experience. Quickly find the best mods for your playstyle with our easy search feature. Play Minecraft with new adventures today!',
      name: 'modsAwesome',
      desc: '',
      args: [],
    );
  }

  /// `LET’S GO!`
  String get letsGo {
    return Intl.message(
      'LET’S GO!',
      name: 'letsGo',
      desc: '',
      args: [],
    );
  }

  /// `Like this app`
  String get likeThisApp {
    return Intl.message(
      'Like this app',
      name: 'likeThisApp',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instruction {
    return Intl.message(
      'Instructions',
      name: 'instruction',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Progress...`
  String get progress {
    return Intl.message(
      'Progress...',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
