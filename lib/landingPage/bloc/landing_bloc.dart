import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:local_storage/local_storage.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc({required this.localStorageRepository}) : super(LandingInitial());
  final LocalStorage localStorageRepository;

  @override
  Stream<LandingState> mapEventToState(
    LandingEvent event,
  ) async* {}
}
