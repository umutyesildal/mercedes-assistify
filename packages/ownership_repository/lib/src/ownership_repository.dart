import 'package:ownership_repository/src/entity/ownership_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class OwnershipRepository {
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future<OwnershipEntity> getOwnership(String ownershipId);

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
