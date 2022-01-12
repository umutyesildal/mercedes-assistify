part of 'car_bloc.dart';

@immutable
abstract class CarEvent extends Equatable {
  const CarEvent();

  @override
  List<Object> get props => [];
}

class GetOwnershipAndCar extends CarEvent {
  GetOwnershipAndCar();

  @override
  List<Object> get props => [];
}
