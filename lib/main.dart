import 'package:flutter/material.dart';
import 'app.dart';
import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(App());
}
