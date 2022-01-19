import 'package:car_repository/src/car_repository.dart';
import 'package:car_repository/template_repository.dart';
import 'package:firebase_client/firebase_client.dart';
import 'dart:convert';
import 'dart:math';

class CarConcreteRepository extends CarRepository {
  Future init() async {}

  @override
  Future<CarEntity> getCar(String carId) async {
    CarEntity currentCar;
    try {
      final Map<String, dynamic> data = await fc.getCar(carId);
      currentCar = CarEntity.fromMap(data);
      var newKilometer = setKilometer();
      print(currentCar.weeklyKilometer);//2358
      print(currentCar.remainingFuel);//46.94
      print(currentCar.kilometer);
      currentCar.kilometer= newKilometer.toString();
      currentCar.weeklyKilometer=(int.parse(currentCar.weeklyKilometer) + newKilometer).toString();
      var tempFuel= (newKilometer * int.parse(currentCar.averageConsumption)) / 100;
      currentCar.remainingFuel=(double.parse(currentCar.remainingFuel)-tempFuel).toStringAsFixed(2);
      print(currentCar.remainingFuel);
      await fc.updateCarCollection(currentCar.docID, currentCar.weeklyKilometer, currentCar.remainingFuel);
      print("bitti2");
      return currentCar;
    } catch (e) {
      throw e;
    }
  }
  int setKilometer(){
    var random = new Random();
    int newKilometer= random.nextInt(200);
    return newKilometer;
  }
  @override
  void close() {}
}
