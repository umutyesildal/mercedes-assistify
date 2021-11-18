import 'package:car_repository/src/car_repository.dart';
import 'package:car_repository/template_repository.dart';
import 'package:firebase_client/firebase_client.dart';

class CarConcreteRepository extends CarRepository {
  Future init() async {}

  @override
  Future<CarEntity> getCar() async {
    CarEntity currentCar;
    try {
      final Map<String, dynamic> data= await fc.getCar();
      print(data);
      currentCar = CarEntity.fromMap(data);
      print(currentCar);
      return currentCar;
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
