part of 'car_bloc.dart';

enum CarFetchedStatus { notStarted, success, failed, inProgress }

class CarState extends Equatable {
  const CarState({
    this.currentCar,
    this.carStatus = CarFetchedStatus.notStarted,
  });

  final CarEntity? currentCar;
  final CarFetchedStatus carStatus;

  @override
  List<Object?> get props => [currentCar, carStatus];

  CarState copyWith({
    CarEntity? currentCar,
    CarFetchedStatus? carStatus,
  }) {
    return CarState(
      currentCar: currentCar ?? this.currentCar,
      carStatus: carStatus ?? this.carStatus,
    );
  }
}
