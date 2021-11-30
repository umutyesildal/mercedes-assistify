import 'package:service_repository/src/entity/service_entity.dart';
import 'package:service_repository/template_repository.dart';

abstract class FirebaseClient {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  Future<Map<String, dynamic>> getCar();
  Future<Map<String, dynamic>> getService();
  Future setService(ServiceEntity service);
  Future<Map<String, dynamic>> getUser();
  Future<Map<String, dynamic>> getOwnership();
  Future<Map<String, dynamic>> getMaintenance();
  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}