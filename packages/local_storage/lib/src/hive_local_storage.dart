import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_repository/user_repository.dart';

import 'local_storage.dart';

class SFLocalStorage extends LocalStorage {
  static Box? _hiveBoxUser;
  static Box? _hiveBoxOwnership;
  static Box? _hiveBoxTheme;
  static Box? _hiveBoxLocale;
  static Box? _hiveBoxAuth;
  static String _userBoxOwnership = 'ownership';
  static String _userBoxName = 'user';
  static String _themeBoxName = 'theme';
  static String _localeBoxName = 'locale';
  static String _authBoxName = 'auth';

// init function to create,populate,update hive database boxes.
  @override
  Future<SFLocalStorage> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<UserEntity>(UserEntityAdapter());
    _hiveBoxOwnership ??= await Hive.openBox<String>(_userBoxOwnership);
    _hiveBoxUser ??= await Hive.openBox<UserEntity>(_userBoxName);
    _hiveBoxTheme ??= await Hive.openBox<bool>(_themeBoxName);
    _hiveBoxLocale ??= await Hive.openBox<String>(_localeBoxName);
    _hiveBoxAuth ??= await Hive.openBox<bool>(_authBoxName);

    if (_hiveBoxTheme!.isEmpty) {
      _hiveBoxTheme!.put(0, false);
    }
    if (_hiveBoxLocale!.isEmpty) {
      _hiveBoxLocale!.put(0, 'en');
    }
    if (_hiveBoxAuth!.isEmpty) {
      _hiveBoxAuth!.put(0, false);
    }
    return this;
  }

  Future changeTheme({required bool theme}) async {
    try {
      await _hiveBoxTheme!.put(0, theme);
    } catch (e) {
      throw e;
    }
  }

  Future<bool?> getTheme() async {
    try {
      bool theme = await _hiveBoxTheme!.getAt(0);
      return theme;
    } catch (e) {
      throw e;
    }
  }

  Future changeLocale({required String locale}) async {
    try {
      print('Inside Database Change Locale');
      await _hiveBoxLocale!.put(0, locale);
    } catch (e) {
      throw e;
    }
  }

  Future<String?> getLocale() async {
    try {
      String locale = await _hiveBoxLocale!.getAt(0);
      return locale;
    } catch (e) {
      throw e;
    }
  }

  Future changeOwnership({required String givenOwnership}) async {
    try {
      print('Inside Database Change Locale');
      await _hiveBoxOwnership!.put(0, givenOwnership);
    } catch (e) {
      throw e;
    }
  }

  Future<String?> getOwnership() async {
    try {
      String ownership = await _hiveBoxOwnership!.getAt(0);
      return ownership;
    } catch (e) {
      throw e;
    }
  }

  Future changeAuth({required bool auth}) async {
    try {
      print('Inside Database Change Auth');
      await _hiveBoxAuth!.put(0, auth);
    } catch (e) {
      throw e;
    }
  }

  Future<bool?> getAuth() async {
    try {
      bool auth = await _hiveBoxAuth!.getAt(0);
      return auth;
    } catch (e) {
      throw e;
    }
  }

  Future changeUser({required UserEntity user}) async {
    try {
      await _hiveBoxUser!.put(0, user);
    } catch (e) {
      throw e;
    }
  }

  Future<UserEntity?> getUser() async {
    bool? isUser = await getAuth();

    try {
      if (isUser!) {
        return await _hiveBoxUser!.getAt(0);
      } else {
        return UserEntity.empty();
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  void close() {}
}
