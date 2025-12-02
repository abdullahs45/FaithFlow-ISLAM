import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeDateCard extends StatelessWidget {
  final RxString time;
  final RxString date;

  const TimeDateCard({super.key, required this.time, required this.date});

  @override
  Widget build(BuildContext context) {
    return // Time and Date Card
    Obx(
      () => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.blue.shade50],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time.value,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date.value,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Icon(Icons.access_time, size: 40, color: Colors.green.shade700),
            ],
          ),
        ),
      ),
    );
  }
}
