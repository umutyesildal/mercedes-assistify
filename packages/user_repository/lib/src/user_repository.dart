import 'package:user_repository/src/entity/user_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class UserRepository {
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future<UserEntity> getUser();
  Future setUser(UserEntity user);
  Future<bool> checkUser(UserEntity user);

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
