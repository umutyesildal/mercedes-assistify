import 'package:service_repository/src/service_repository.dart';
import 'package:service_repository/template_repository.dart';
import 'package:firebase_client/firebase_client.dart';

class ServiceConcreteRepository extends ServiceRepository {
  Future init() async {}

  Future setService(ServiceEntity service) async {
    ServiceEntity serviceStatus;
    try {
      await fc.setService(service);
      print("service_concrete_repository");
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<ServiceEntity> getService(String givenId) async {
    try {
      final Map<String, dynamic> data = await fc.getService(givenId);
      ServiceEntity serviceStatus = ServiceEntity.fromMap(data);
      return serviceStatus;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
