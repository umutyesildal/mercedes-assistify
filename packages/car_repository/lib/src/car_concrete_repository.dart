import 'package:car_repository/src/car_repository.dart';
import 'package:car_repository/template_repository.dart';

class CarConcreteRepository extends CarRepository {
  Future init() async {}

  @override
  Future<CarEntity> getCar() async {
    CarEntity currentCar;
    try {
      //    currentCar = await firebaseClient.getCar();
    } catch (e) {
      throw e;
    }
    return CarEntity.empty();
  }

  @override
  void close() {}
}
