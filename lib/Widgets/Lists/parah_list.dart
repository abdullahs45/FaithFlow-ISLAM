import 'package:faithflow_islam/Controllers/quran_controller.dart';
import 'package:faithflow_islam/Widgets/Details/parah_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

Widget parahList(QuranController controller) {
  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: controller.parahs.length,
    itemBuilder: (context, index) {
      final parah = controller.parahs[index];
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.blue.shade100),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade700,
            child: Text(
              parah['number'].toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(
            parah['name'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(parah['range']),
              const SizedBox(height: 2),
              Text(
                'Surah ${parah['startSurah']} - ${parah['endSurah']}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
          trailing: Obx(() {
            final isFav = controller.favouriteParahs.contains(parah['number']);
            return IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.grey,
              ),
              onPressed: () => controller.toggleParahFavourite(parah['number']),
            );
          }),
          onTap: () => parahDetails(parah),
        ),
      );
    },
  );
}
