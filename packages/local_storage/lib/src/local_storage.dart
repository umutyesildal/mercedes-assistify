// abstract class so that bloc can reach and we can create new methods in another class.

abstract class LocalStorage {
  Future<LocalStorage> init();
  Future changeTheme({required bool theme});
  Future<bool?> getTheme();
  Future changeLocale({required String locale});
  Future<String?> getLocale();
  Future changeAuth({required bool auth});
  Future<bool?> getAuth();
  void close();
}
