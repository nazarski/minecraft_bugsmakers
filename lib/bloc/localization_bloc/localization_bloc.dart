import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial()) {
    on<LocalizationEvent>((event, emit) {
      final String deviceLocale = Platform.localeName.split('_').first;

    });
  }
}
