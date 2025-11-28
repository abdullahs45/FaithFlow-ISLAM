import 'package:faithflow_islam/Controllers/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuranController controller = Get.find<QuranController>();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QURAN'),
          backgroundColor: const Color.fromARGB(223, 216, 59, 111),
          foregroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'By Surah'),
              Tab(text: 'By Parah'),
              Tab(text: 'Favourites'),
            ],
            // Tab colors customization
            indicatorColor: Colors.white, // Color of the selected tab indicator
            indicatorWeight: 3, // Thickness of the indicator
            labelColor: Colors.white, // Color of selected tab text
            unselectedLabelColor:
                Colors.white70, // Color of unselected tab text
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildSurahList(controller),
            _buildParahList(controller),
            _buildFavouriteList(controller),
          ],
        ),
      ),
    );
  }

  // Surah List - Green Color Theme
  Widget _buildSurahList(QuranController controller) {
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
              final isFav = controller.favouriteSurahs.contains(
                surah['number'],
              );
              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.grey,
                ),
                onPressed:
                    () => controller.toggleSurahFavourite(surah['number']),
              );
            }),
            onTap: () => _showSurahDetails(surah),
          ),
        );
      },
    );
  }

  // Parah List - Blue Color Theme
  Widget _buildParahList(QuranController controller) {
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
              final isFav = controller.favouriteParahs.contains(
                parah['number'],
              );
              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.grey,
                ),
                onPressed:
                    () => controller.toggleParahFavourite(parah['number']),
              );
            }),
            onTap: () => _showParahDetails(parah),
          ),
        );
      },
    );
  }

  // Favourites List - Orange/Amber Color Theme with Unfavourite
  Widget _buildFavouriteList(QuranController controller) {
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
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    )
                  else
                    Text(
                      'Surah ${item['startSurah']} - ${item['endSurah']}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
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
                  _showSurahDetails(item);
                } else {
                  _showParahDetails(item);
                }
              },
            ),
          );
        },
      );
    });
  }

  void _showSurahDetails(Map<String, dynamic> surah) {
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
              _buildDetailRow('Surah Number', surah['number'].toString()),
              _buildDetailRow('Total Verses', '${surah['verses']}'),
              _buildDetailRow('Type', surah['type']),
              _buildDetailRow(
                'Revelation Order',
                surah['revelationOrder'].toString(),
              ),
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

  void _showParahDetails(Map<String, dynamic> parah) {
    Get.dialog(
      AlertDialog(
        title: Text(
          parah['name'],
          style: TextStyle(color: Colors.blue.shade700),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Parah Number', parah['number'].toString()),
              _buildDetailRow('Range', parah['range']),
              _buildDetailRow('Start Surah', 'Surah ${parah['startSurah']}'),
              _buildDetailRow('End Surah', 'Surah ${parah['endSurah']}'),
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
