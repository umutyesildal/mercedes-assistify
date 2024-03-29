import 'package:user_repository/src/entity/user_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class UserRepository {
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future<UserEntity> getUser(String userMail);
  Future setUser(UserEntity user);
  Future<bool> checkAuth(UserEntity user);
  Future<bool> checkOwnership(UserEntity user);
  Future<bool> addOwnership(UserEntity user);

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
