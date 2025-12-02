import 'package:faithflow_islam/Widgets/Details/detail_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void parahDetails(Map<String, dynamic> parah) {
  Get.dialog(
    AlertDialog(
      title: Text(parah['name'], style: TextStyle(color: Colors.blue.shade700)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            detailRow('Parah Number', parah['number'].toString()),
            detailRow('Range', parah['range']),
            detailRow('Start Surah', 'Surah ${parah['startSurah']}'),
            detailRow('End Surah', 'Surah ${parah['endSurah']}'),
            const SizedBox(height: 16),
            const Text(
              'Parah content will be displayed here.',
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
