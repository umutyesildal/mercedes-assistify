import 'package:maintenance_repository/src/maintenance_repository.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:firebase_client/firebase_client.dart';

class MaintenanceConcreteRepository extends MaintenanceRepository {
  Future init() async {}

  @override
  Future<MaintenanceEntity> getMaintenance() async {
    MaintenanceEntity currentMaintenance;
    try {
      final Map<String, dynamic> data = await fc.getMaintenance();
      print(data);
      currentMaintenance = MaintenanceEntity.fromMap(data);
      print(currentMaintenance);
      return currentMaintenance;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
