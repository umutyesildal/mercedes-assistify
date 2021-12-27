part of 'car_bloc.dart';

enum CarFetchedStatus { notStarted, success, failed, inProgress }
enum OwnershipFetchedStatus { notStarted, success, failed, inProgress }

class CarState extends Equatable {
  const CarState({
    this.currentCar,
    this.currentOwnership,
    this.OwnershipStatus = OwnershipFetchedStatus.notStarted,
  });
  final CarEntity? currentCar;
  final OwnershipEntity? currentOwnership;
  final OwnershipFetchedStatus OwnershipStatus;

  @override
  List<Object?> get props => [currentCar, currentOwnership, OwnershipStatus];

  CarState copyWith({
    CarEntity? currentCar,
    OwnershipEntity? currentOwnership,
    OwnershipFetchedStatus? OwnershipStatus,
  }) {
    return CarState(
      currentCar: currentCar ?? this.currentCar,
      currentOwnership: currentOwnership ?? this.currentOwnership,
      OwnershipStatus: OwnershipStatus ?? this.OwnershipStatus,
    );
  }
}
