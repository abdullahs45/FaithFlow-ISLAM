import 'package:faithflow_islam/Controllers/btm_nav_controller.dart';
import 'package:faithflow_islam/Controllers/profile_controller.dart';
import 'package:faithflow_islam/Controllers/quran_controller.dart';
import 'package:faithflow_islam/Controllers/tasbeeh_controller.dart';
import 'package:faithflow_islam/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FaithFlow ISLAM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => BottomNavController());
        Get.lazyPut(() => ProfileController());
        Get.lazyPut(() => TasbeehController());
        Get.lazyPut(() => QuranController());
      }),
    );
  }
}
