import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:car_repository/template_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:local_storage/local_storage.dart';
import 'package:ownership_repository/ownership_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({
    required this.localStorageRepository,
    required this.carRepository,
    required this.ownershipRepository,
    required this.userRepository,
  }) : super(CarState()) {
    on<CarEvent>((event, emit) async {
      if (event is GetOwnershipAndCar) {
        await _handleGetOwnershipAndCar(event, emit);
      }
    });
  }
  final LocalStorage localStorageRepository;
  final CarRepository carRepository;
  final OwnershipRepository ownershipRepository;
  final UserRepository userRepository;

  Future _handleGetOwnershipAndCar(
      GetOwnershipAndCar event, Emitter<CarState> emit) async {
    emit(state.copyWith(OwnershipStatus: OwnershipFetchedStatus.inProgress));
    try {
      UserEntity? currentUser = await localStorageRepository.getUser();
      OwnershipEntity currentOwnership =
          await ownershipRepository.getOwnership(currentUser!.ownership[0]);
      CarEntity? car = await carRepository.getCar(currentOwnership.car);
      emit(state.copyWith(
        currentOwnership: currentOwnership,
        OwnershipStatus: OwnershipFetchedStatus.success,
        currentCar: car,
      ));
    } catch (e) {
      emit(state.copyWith(
          OwnershipStatus: OwnershipFetchedStatus.failed,
          currentCar: CarEntity.empty()));
    }

    print(state.currentCar!.engine);
  }
}
