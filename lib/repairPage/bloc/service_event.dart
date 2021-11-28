part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class GetServicesEvent extends ServiceEvent {
  GetServicesEvent();

  @override
  List<Object> get props => [];
}

class AddServicesEvent extends ServiceEvent {
  AddServicesEvent({required this.givenService});

  final ServiceEntity givenService;

  @override
  List<Object> get props => [givenService];
}
