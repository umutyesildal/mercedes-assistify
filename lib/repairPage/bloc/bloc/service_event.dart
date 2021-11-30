part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class SendService extends ServiceEvent {
  SendService({required this.service});

  final ServiceEntity service;
  @override
  List<Object> get props => [service];
}
