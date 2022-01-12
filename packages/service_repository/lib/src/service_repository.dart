import 'package:service_repository/src/entity/service_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class ServiceRepository {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future setService(ServiceEntity service);
  Future<ServiceEntity> getService(String givenId);
  Future<List<ServiceEntity>> getAllPreviousServices(List<String> givenIds);

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
