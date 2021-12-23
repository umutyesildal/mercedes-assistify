part of 'service_bloc.dart';

enum OngoingServiceFetchedStatus { notStarted, success, failed, inProgress }
enum PreviousServicesFetchedStatus { notStarted, success, failed, inProgress }

class ServiceState extends Equatable {
  const ServiceState(
      {this.currentMaintenance,
      this.currentService,
      this.currentOwnership,
      this.ongoingServiceFetchedStatus = OngoingServiceFetchedStatus.notStarted,
      this.previousServiceFetchedStatus =
          PreviousServicesFetchedStatus.notStarted});

  final MaintenanceEntity? currentMaintenance;
  final ServiceEntity? currentService;
  final OwnershipEntity? currentOwnership;
  final OngoingServiceFetchedStatus ongoingServiceFetchedStatus;
  final PreviousServicesFetchedStatus previousServiceFetchedStatus;

  @override
  List<Object?> get props => [
        currentMaintenance,
        currentService,
        currentOwnership,
        ongoingServiceFetchedStatus,
        previousServiceFetchedStatus
      ];

  ServiceState copyWith(
      {MaintenanceEntity? currentMaintenance,
      ServiceEntity? currentService,
      OngoingServiceFetchedStatus? ongoingServiceFetchedStatus,
      PreviousServicesFetchedStatus? previousServiceFetchedStatus,
      OwnershipEntity? currentOwnership}) {
    return ServiceState(
      currentMaintenance: currentMaintenance ?? this.currentMaintenance,
      currentService: currentService ?? this.currentService,
      currentOwnership: currentOwnership ?? this.currentOwnership,
      ongoingServiceFetchedStatus:
          ongoingServiceFetchedStatus ?? this.ongoingServiceFetchedStatus,
      previousServiceFetchedStatus:
          previousServiceFetchedStatus ?? this.previousServiceFetchedStatus,
    );
  }
}
