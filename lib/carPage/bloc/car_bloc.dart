import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:car_repository/template_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:local_storage/local_storage.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({required this.localStorageRepository, required this.carRepository})
      : super(CarState()) {
    on<CarEvent>((event, emit) async {
      if (event is GetCar) {
        await _handleGetCar(event, emit);
      }
    });
  }
  final LocalStorage localStorageRepository;
  final CarRepository carRepository;

  Future _handleGetCar(GetCar event, Emitter<CarState> emit) async {
    emit(state.copyWith(carStatus: CarFetchedStatus.inProgress));

    try {
      CarEntity? car = await carRepository.getCar();
      print('Car succesfully fetched.');
      emit(
          state.copyWith(currentCar: car, carStatus: CarFetchedStatus.success));
    } catch (e) {
      emit(state.copyWith(
          carStatus: CarFetchedStatus.failed, currentCar: CarEntity.empty()));
    }

    print(state.currentCar!.beygir);
  }
}
