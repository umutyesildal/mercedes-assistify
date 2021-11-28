import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service_repository/template_repository.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc({required this.serviceRepository}) : super(ServiceInitial());
  final ServiceRepository serviceRepository;

  @override
  Stream<ServiceState> mapEventToState(
    ServiceEvent event,
  ) async* {
    if (event is GetServicesEvent) {
      yield* _mapGetServicesState(event, state);
    } else if (event is AddServicesEvent) {
      yield* _mapAddServicesState(event, state);
    }
  }

  Stream<ServiceState> _mapGetServicesState(
      GetServicesEvent event, ServiceState state) async* {
    print('Getting Services');
  }

  Stream<ServiceState> _mapAddServicesState(
      AddServicesEvent event, ServiceState state) async* {
    print('Adding Services');
    ServiceEntity service = new ServiceEntity(
        gelis_tarihi: event.givenService.gelis_tarihi,
        teslim_tarihi: event.givenService.teslim_tarihi,
        ownership: event.givenService.ownership,
        maintenance: event.givenService.maintenance);
    await serviceRepository.setService(service);
  }
}
