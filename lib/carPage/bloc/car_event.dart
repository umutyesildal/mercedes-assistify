part of 'car_bloc.dart';

@immutable
abstract class CarEvent extends Equatable {
  const CarEvent();

  @override
  List<Object> get props => [];
}

class GetCar extends CarEvent {
  GetCar();

  @override
  List<Object> get props => [];
}
