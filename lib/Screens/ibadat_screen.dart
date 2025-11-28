import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tasbeeh_screen.dart';

class IbadatScreen extends StatelessWidget {
  const IbadatScreen({super.key});

  final List<Map<String, dynamic>> ibadatItems = const [
    {
      'title': 'Prayer (Salah)',
      'subtitle': 'How to perform Salah',
      'icon': Icons.handshake,
      'color': Colors.green,
    },
    {
      'title': 'Fasting (Sawm)',
      'subtitle': 'Guidelines for fasting',
      'icon': Icons.wb_sunny,
      'color': Colors.orange,
    },
    {
      'title': 'Hajj',
      'subtitle': 'Pilgrimage to Makkah',
      'icon': Icons.temple_hindu,
      'color': Colors.blue,
    },
    {
      'title': 'Umrah',
      'subtitle': 'Lesser pilgrimage',
      'icon': Icons.location_city,
      'color': Colors.purple,
    },
    {
      'title': 'Nimaaz e Jinaza',
      'subtitle': 'Funeral prayer',
      'icon': Icons.church,
      'color': Colors.grey,
    },
    {
      'title': 'Tasbeeh',
      'subtitle': 'Dhikr counter',
      'icon': Icons.add_circle,
      'color': Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IBADAT'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ibadatItems.length,
        itemBuilder: (context, index) {
          final item = ibadatItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                if (item['title'] == 'Tasbeeh') {
                  Get.to(() => const TasbeehScreen());
                } else {
                  Get.dialog(
                    AlertDialog(
                      title: Text(item['title'] as String),
                      content: const Text(
                        'Detailed instructions will be displayed here.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                }
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (item['color'] as Color).withOpacity(0.5),
                      (item['color'] as Color).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'] as String,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: (item['color'] as Color).withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['subtitle'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: item['color'] as Color,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
