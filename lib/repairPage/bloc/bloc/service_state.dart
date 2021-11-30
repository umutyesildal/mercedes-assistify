part of 'service_bloc.dart';

class ServiceState extends Equatable {
  const ServiceState({
    this.currentMaintenance,
    this.currentService,
  });

  final MaintenanceEntity? currentMaintenance;
  final ServiceEntity? currentService;

  @override
  List<Object?> get props => [currentMaintenance, currentService];

  ServiceState copyWith({
    MaintenanceEntity? currentMaintenance,
    ServiceEntity? currentService,
  }) {
    return ServiceState(
      currentMaintenance: currentMaintenance ?? this.currentMaintenance,
      currentService: currentService ?? this.currentService,
    );
  }
}
