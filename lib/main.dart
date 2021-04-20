import 'package:flutter/material.dart';
import './core/core.dart';
import 'package:wakelock/wakelock.dart';
import 'dart:io';

Future<bool> setupDebugHooks() async {
  print("habilitando wakelock");
  if (Platform.isAndroid) {
    await Wakelock.enable();
  }
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assert(await setupDebugHooks());
  print("iniciado");
  runApp(AppWidget());
}
