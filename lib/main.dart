import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tst_appka/src/app.dart';


void main() async {// Регистрируем адаптер
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Оборачиваем MyApp в DevicePreview
    ),
  );
}
