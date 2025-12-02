import 'package:faithflow_islam/Controllers/quran_controller.dart';
import 'package:faithflow_islam/Widgets/Details/surah_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget surahList(QuranController controller) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: controller.surahs.length,
    itemBuilder: (context, index) {
      final surah = controller.surahs[index];
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.green.shade100),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.shade700,
            child: Text(
              surah['number'].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            'Surah ${surah['name']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${surah['verses']} verses • ${surah['type']}'),
              const SizedBox(height: 2),
              Text(
                'Revelation Order: ${surah['revelationOrder']}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
          trailing: Obx(() {
            final isFav = controller.favouriteSurahs.contains(surah['number']);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
              ),
              onPressed: () => controller.toggleSurahFavourite(surah['number']),
            );
          }),
          onTap: () => surahDetails(surah),
        ),
      );
    },
  );
}
