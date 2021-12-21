import 'package:user_repository/src/user_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:firebase_client/firebase_client.dart';

class UserConcreteRepository extends UserRepository {
  Future init() async {}

  @override
  Future<UserEntity> getUser() async {
    UserEntity currentUser;
    try {
      final Map<String, dynamic> data = await fc.getUser();
      print(data);
      currentUser = UserEntity.fromMap(data);
      print(currentUser);
      return currentUser;
    } catch (e) {
      throw e;
    }
  }

  Future setUser(UserEntity user) async {
    UserEntity userStatus;
    try {
      await fc.setUser(user);
      print("service_concrete_repository");
    } catch (e) {
      throw e;
    }
  }

  Future<bool> checkAuth(UserEntity user) async {
    try {
      bool checkUser = await fc.checkAuth(user);

      if (checkUser) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<bool> checkOwnership(UserEntity user) async {
    try {
      bool checkUser = await fc.checkOwnership(user);

      return checkUser;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> addOwnership(UserEntity user) async {
    try {
      bool checkUser = await fc.addOwnership(user);
      return checkUser;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
