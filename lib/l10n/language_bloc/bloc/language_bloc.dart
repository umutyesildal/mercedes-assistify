import 'dart:async';
import 'dart:ui';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:template/l10n/enum/language_enum.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(null));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {}
}
