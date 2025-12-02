import 'package:faithflow_islam/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void upcomingPrayerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Upcoming Prayer Time"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              Get.find<HomeController>().upcomingPrayer.value.split(', ').map((
                entry,
              ) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(entry),
                );
              }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      );
    },
  );
}
