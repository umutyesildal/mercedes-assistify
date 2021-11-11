part of 'language_bloc.dart';

class LanguageState extends Equatable {
  LanguageState(this.locale);

  final Locale? locale;
  @override
  List<Object?> get props => [locale];
}
