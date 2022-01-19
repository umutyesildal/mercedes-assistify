part of 'settings_bloc.dart';

enum NameFetchedStatus { notStarted, success, failed, inProgress }

@immutable
class SettingsState extends Equatable {
  const SettingsState({
    this.user,
    this.nameStatus = NameFetchedStatus.notStarted,
  });
  final UserEntity? user;
  final NameFetchedStatus nameStatus;

  @override
  List<Object?> get props => [user];

  SettingsState copyWith({
    UserEntity? user,
    NameFetchedStatus? nameStatus,
  }) {
    return SettingsState(
      user: user ?? this.user,
      nameStatus: nameStatus ?? this.nameStatus,
    );
  }
}
