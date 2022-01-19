import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.localStorageRepository,
  }) : super(SettingsState());
  final LocalStorage localStorageRepository;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is GetUserName) {
      yield* _mapUserNameToState(event, state);
    }
  }

  Stream<SettingsState> _mapUserNameToState(
      GetUserName event, SettingsState state) async* {
    UserEntity? user = await localStorageRepository.getUser();
    print(user!.name);
    yield state.copyWith(
      user: user,
      nameStatus: NameFetchedStatus.success,
    );
  }
}
