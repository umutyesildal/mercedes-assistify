part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class SendService extends ServiceEvent {
  SendService(
      {required this.phase,
      required this.arriveDate,
      required this.extraServices});

  final String arriveDate;
  final int phase;
  final List<String> extraServices;

  @override
  List<Object> get props => [arriveDate, phase, extraServices];
}

class GetOngoingService extends ServiceEvent {
  GetOngoingService();

  @override
  List<Object> get props => [];
}

class GetAllPreviousServices extends ServiceEvent {}

class CarBlocUpdated extends ServiceEvent {
  CarBlocUpdated({required this.ownershipEntity});

  final OwnershipEntity ownershipEntity;
  @override
  List<Object> get props => [];
}
