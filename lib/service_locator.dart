import 'package:get_it/get_it.dart';
import 'package:local_storage/local_storage.dart';
import 'package:firebase_client/firebase_client.dart';
import 'package:car_repository/template_repository.dart';
import 'package:service_repository/template_repository.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerSingletonAsync<LocalStorage>(() async {
    final SFLocalStorage localStorage = SFLocalStorage();
    await localStorage.init();
    await Future.delayed(Duration(seconds: 2));
    return localStorage;
  });

    sl.registerSingletonAsync<FirebaseClient>(() async {
    final FirebaseClientConcrete fireBaseClient = FirebaseClientConcrete();
    await fireBaseClient.init();
    await Future.delayed(Duration(seconds: 2));
    return fireBaseClient;
  });

  sl.registerSingletonAsync<CarRepository>(() async {
    final CarConcreteRepository carRepository = CarConcreteRepository();
    await carRepository.init();
    await Future.delayed(Duration(seconds: 2));
    return carRepository;
  });

  sl.registerSingletonAsync<ServiceRepository>(() async {
    final ServiceConcreteRepository serviceRepository = ServiceConcreteRepository();
    await serviceRepository.init();
    await Future.delayed(Duration(seconds: 2));
    return serviceRepository;
  });
}
