import 'package:bloc/bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ownership_repository/ownership_repository.dart';
import 'package:service_repository/template_repository.dart';
import 'package:template/carPage/carPage.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc(
      {required this.maintenanceRepository,
      required this.localStorage,
      required this.serviceRepository,
      required this.carBloc,
      required this.ownershipRepository})
      : super(ServiceState()) {
    carBloc.stream.listen((state) {
      if (state.currentOwnership != null)
        add(CarBlocUpdated(ownershipEntity: state.currentOwnership!));
    });

    on<ServiceEvent>((event, emit) async {
      if (event is SendService) {
        await _handleSetServiceState(event, emit);
      } else if (event is GetOngoingService) {
        await _handleGetOngoingServiceState(event, emit);
      } else if (event is GetAllPreviousServices) {
        await _handleGetAllPreviousServicesState(event, emit);
      } else if (event is CarBlocUpdated) {
        emit(state.copyWith(currentOwnership: event.ownershipEntity));
      }
    });
  }
  final CarBloc carBloc;
  final MaintenanceRepository maintenanceRepository;
  final ServiceRepository serviceRepository;
  final OwnershipRepository ownershipRepository;
  final LocalStorage localStorage;

  Future _handleSetServiceState(
      SendService event, Emitter<ServiceState> emit) async {
    String? currentOwnership = await localStorage.getOwnership();
    print('x');
    ServiceEntity service = ServiceEntity(
      arriveDate: event.arriveDate,
      ownership: currentOwnership!,
      phase: event.phase,
      extraServices: event.extraServices,
    );
    try {
      await serviceRepository.setService(service);
    } catch (e) {}
  }

  Future _handleGetOngoingServiceState(
      GetOngoingService event, Emitter<ServiceState> emit) async {
    ServiceEntity currentService = await serviceRepository
        .getService(state.currentOwnership!.ongoingService);

    emit(state.copyWith(
        currentService: currentService,
        ongoingServiceFetchedStatus: OngoingServiceFetchedStatus.success));
  }

  Future _handleGetAllPreviousServicesState(
      GetAllPreviousServices event, Emitter<ServiceState> emit) async {
    try {
      List<ServiceEntity> allPreviousServices = await serviceRepository
          .getAllPreviousServices(state.currentOwnership!.previousServices);
      emit(state.copyWith(
          allPreviousServices: allPreviousServices,
          previousServiceFetchedStatus: PreviousServicesFetchedStatus.success));
    } catch (e) {
      emit(state.copyWith(
          allPreviousServices: [],
          previousServiceFetchedStatus: PreviousServicesFetchedStatus.failed));
    }
  }
}
