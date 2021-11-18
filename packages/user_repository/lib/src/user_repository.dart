import 'package:user_repository/src/entity/user_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class UserRepository {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future<UserEntity> getUser();
  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
