import 'package:car_repository/src/entity/car_entity.dart';
import 'package:firebase_client/firebase_client.dart';

abstract class CarRepository {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();
  FirebaseClient fc = FirebaseClientConcrete();
  Future<CarEntity> getCar();
  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}
