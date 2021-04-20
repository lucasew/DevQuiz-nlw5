import 'package:flutter/material.dart';
import './core/core.dart';
import 'package:wakelock/wakelock.dart';

Future<bool> setupDebugHooks() async {
  print("habilitando wakelock");
  await Wakelock.enable();
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assert(await setupDebugHooks());
  print("iniciado");
  runApp(AppWidget());
}
