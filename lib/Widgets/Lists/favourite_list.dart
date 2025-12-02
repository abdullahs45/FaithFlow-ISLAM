import 'package:faithflow_islam/Controllers/quran_controller.dart';
import 'package:faithflow_islam/Widgets/Details/parah_details.dart';
import 'package:faithflow_islam/Widgets/Details/surah_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget favouriteList(QuranController controller) {
  return Obx(() {
    // Access reactive variables - this makes GetX track them
    final surahCount = controller.favouriteSurahs.length;
    final parahCount = controller.favouriteParahs.length;

    // Build favourites list directly from reactive sets
    final List<Map<String, dynamic>> favourites = [];

    // Add favourite surahs - iterate through the reactive set
    for (var surahNumber in controller.favouriteSurahs) {
      final surah = controller.surahs.firstWhere(
        (s) => s['number'] == surahNumber,
        orElse: () => <String, dynamic>{},
      );
      if (surah.isNotEmpty) {
        favourites.add({...surah, 'isSurah': true});
      }
    }

    // Add favourite parahs - iterate through the reactive set
    for (var parahNumber in controller.favouriteParahs) {
      final parah = controller.parahs.firstWhere(
        (p) => p['number'] == parahNumber,
        orElse: () => <String, dynamic>{},
      );
      if (parah.isNotEmpty) {
        favourites.add({...parah, 'isSurah': false});
      }
    }

    // Now we can use the counts for empty check or display
    if (surahCount == 0 && parahCount == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: Colors.orange.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              'No favourites yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the heart icons to add favourites',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        final item = favourites[index];
        final isSurah = item['isSurah'] as bool;
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.orange.shade100),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  isSurah ? Colors.green.shade700 : Colors.blue.shade700,
              child: Text(
                item['number'].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              isSurah ? 'Surah ${item['name']}' : item['name'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade900,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isSurah
                      ? '${item['verses']} verses • ${item['type']}'
                      : item['range'] ?? 'Favourite Parah',
                ),
                if (isSurah)
                  Text(
                    'Revelation Order: ${item['revelationOrder']}',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  )
                else
                  Text(
                    'Surah ${item['startSurah']} - ${item['endSurah']}',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                if (isSurah) {
                  controller.removeSurahFavourite(item['number']);
                  Get.snackbar(
                    'Removed',
                    'Surah ${item['name']} removed from favourites',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.orange.shade100,
                  );
                } else {
                  controller.removeParahFavourite(item['number']);
                  Get.snackbar(
                    'Removed',
                    '${item['name']} removed from favourites',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.orange.shade100,
                  );
                }
              },
            ),
            onTap: () {
              if (isSurah) {
                surahDetails(item);
              } else {
                parahDetails(item);
              }
            },
          ),
        );
      },
    );
  });
}
