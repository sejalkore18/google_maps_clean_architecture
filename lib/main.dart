import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/injection_container.dart' as di;
import 'core/services/navigation_service.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Google Maps Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: NavigationService.homeRoute,
      getPages: Get.find<NavigationService>().getPages,
    );
  }
}



