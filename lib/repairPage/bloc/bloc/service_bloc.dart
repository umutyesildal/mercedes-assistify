import 'package:bloc/bloc.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:service_repository/template_repository.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc(
      {required this.maintenanceRepository, required this.serviceRepository})
      : super(ServiceState()) {
    on<ServiceEvent>((event, emit) {
      if (event is SendService) {
        _mapSetServiceState(event, emit);
      }
    });
  }

  final MaintenanceRepository maintenanceRepository;
  final ServiceRepository serviceRepository;

  Future _mapSetServiceState(
      SendService event, Emitter<ServiceState> emit) async {
    print('Set Service');
    ServiceEntity service = event.service;
    try {
      await serviceRepository.setService(service);
    } catch (e) {}
  }
}
