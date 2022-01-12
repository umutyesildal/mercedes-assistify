import 'package:service_repository/src/entity/service_entity.dart';
import 'package:service_repository/template_repository.dart';
import 'package:user_repository/src/entity/user_entity.dart';

abstract class FirebaseClient {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  Future<Map<String, dynamic>> getCar(String carId);
  Future<Map<String, dynamic>> getService(String givenId);
  Future setService(ServiceEntity service);
  Future setUser(UserEntity user);
  Future<Map<String, dynamic>> getUser(String userMail);
  Future<bool> checkAuth(UserEntity user);
  Future<bool> checkUser(UserEntity user);
  Future<bool> checkOwnership(UserEntity user);
  Future<bool> addOwnership(UserEntity user);
  Future<Map<String, dynamic>> getOwnership(String ownershipId);
  Future<Map<String, dynamic>> getMaintenance();
  Future<List<Map<String, dynamic>>> getAllPreviousServices(
      List<String> givenIds);

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
