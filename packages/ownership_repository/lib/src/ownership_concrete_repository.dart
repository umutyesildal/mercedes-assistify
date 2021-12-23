import 'package:ownership_repository/src/ownership_repository.dart';
import 'package:ownership_repository/ownership_repository.dart';
import 'package:firebase_client/firebase_client.dart';

class OwnershipConcreteRepository extends OwnershipRepository {
  Future init() async {}

  @override
  Future<OwnershipEntity> getOwnership(String ownershipId) async {
    try {
      final Map<String, dynamic> data = await fc.getOwnership(ownershipId);
      OwnershipEntity ownershipInfo = OwnershipEntity.fromMap(data);
      print(ownershipInfo);
      return ownershipInfo;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
