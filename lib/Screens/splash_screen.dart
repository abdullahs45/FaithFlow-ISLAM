import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate after 3 seconds using GetX
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed('/home');
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightGreen.shade300,
              Colors.lightBlue.shade300,
              Colors.black87,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Image.asset(
          'assets/images/splash.jpg',
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
