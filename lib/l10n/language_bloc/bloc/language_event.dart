part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageLoadStarted extends LanguageEvent {}

class LanguageSelected extends LanguageEvent {
  LanguageSelected(this.languageCode);

  final Language languageCode;

  @override
  List<Object> get props => [languageCode];
}
