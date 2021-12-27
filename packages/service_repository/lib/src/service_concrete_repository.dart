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

  Future<List<ServiceEntity>> getAllPreviousServices(
      List<String> givenIds) async {
    List<ServiceEntity> allPreviousServices = [];
    try {
      final List<Map<String, dynamic>> data =
          await fc.getAllPreviousServices(givenIds);

      print(data[0]);

      for (int i = 0; i < data.length; i++) {
        allPreviousServices[i] = ServiceEntity.fromMap(data[i]);
        print(allPreviousServices[i].phase);
      }
      return allPreviousServices;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
