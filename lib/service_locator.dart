import 'package:get_it/get_it.dart';
import 'package:local_storage/local_storage.dart';
import 'package:firebase_client/firebase_client.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerSingletonAsync<LocalStorage>(() async {
    final SFLocalStorage localStorage = SFLocalStorage();
    await localStorage.init();
    await Future.delayed(Duration(seconds: 2));
    return localStorage;
  });

    sl.registerSingletonAsync<FirebaseClient>(() async {
    final FirebaseClientConcrete fireBaseClient = FirebaseClientConcrete();
    await fireBaseClient.init();
    await Future.delayed(Duration(seconds: 2));
    return fireBaseClient;
  });
}
