import 'package:flutter/material.dart';
import 'package:SMART_COVigilante/app/covigi_app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.storage.request();

  runApp(CovigiApp());
}



