import 'package:faithflow_islam/Widgets/Details/detail_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void surahDetails(Map<String, dynamic> surah) {
  Get.dialog(
    AlertDialog(
      title: Text(
        'Surah ${surah['name']}',
        style: TextStyle(color: Colors.green.shade700),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            detailRow('Surah Number', surah['number'].toString()),
            detailRow('Total Verses', '${surah['verses']}'),
            detailRow('Type', surah['type']),
            detailRow('Revelation Order', surah['revelationOrder'].toString()),
            const SizedBox(height: 16),
            const Text(
              'Quran content will be displayed here.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Close')),
      ],
    ),
  );
}
