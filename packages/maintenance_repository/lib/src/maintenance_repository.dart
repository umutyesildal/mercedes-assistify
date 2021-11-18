import 'package:maintenance_repository/src/entity/maintenance_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class MaintenanceRepository {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future<MaintenanceEntity> getMaintenance();
  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
