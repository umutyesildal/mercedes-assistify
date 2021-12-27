import 'package:service_repository/src/entity/service_entity.dart';
import 'package:service_repository/template_repository.dart';
import 'package:user_repository/src/entity/user_entity.dart';

abstract class FirebaseClient {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  Future<Map<String, dynamic>> getCar();
  Future<Map<String, dynamic>> getService(String givenId);
  Future setService(ServiceEntity service);
  Future setUser(UserEntity user);
  Future<Map<String, dynamic>> getUser();
  Future<bool> checkUser(UserEntity user);

  Future<Map<String, dynamic>> getOwnership();
  Future<Map<String, dynamic>> getMaintenance();

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
