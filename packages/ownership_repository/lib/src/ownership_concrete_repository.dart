import 'package:ownership_repository/src/ownership_repository.dart';
import 'package:ownership_repository/template_repository.dart';
import 'package:firebase_client/firebase_client.dart';

class OwnershipConcreteRepository extends OwnershipRepository {
  Future init() async {}

  @override
  Future<OwnershipEntity> getOwnership() async {
    OwnershipEntity ownershipInfo;
    try {
      final Map<String, dynamic> data= await fc.getOwnership();
      print(data);
      ownershipInfo = OwnershipEntity.fromMap(data);
      print(ownershipInfo);
      return ownershipInfo;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
