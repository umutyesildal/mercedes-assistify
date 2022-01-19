part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class GetUserName extends SettingsEvent {}
