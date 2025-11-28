import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  final List<Map<String, dynamic>> hadithBooks = const [
    {
      'name': 'Sahih Bukhari',
      'author': 'Imam Bukhari',
      'hadiths': '7,275',
      'color': Colors.green,
    },
    {
      'name': 'Sahih Muslim',
      'author': 'Imam Muslim',
      'hadiths': '7,190',
      'color': Colors.blue,
    },
    {
      'name': 'Sunan Abu Dawood',
      'author': 'Imam Abu Dawood',
      'hadiths': '4,800',
      'color': Colors.orange,
    },
    {
      'name': 'Jami\' at-Tirmidhi',
      'author': 'Imam Tirmidhi',
      'hadiths': '3,956',
      'color': Colors.purple,
    },
    {
      'name': 'Sunan an-Nasa\'i',
      'author': 'Imam Nasa\'i',
      'hadiths': '5,761',
      'color': Colors.teal,
    },
    {
      'name': 'Sunan Ibn Majah',
      'author': 'Imam Ibn Majah',
      'hadiths': '4,341',
      'color': Colors.red,
    },
    {
      'name': 'Muwatta Malik',
      'author': 'Imam Malik',
      'hadiths': '1,720',
      'color': Colors.indigo,
    },
    {
      'name': 'Musnad Ahmad',
      'author': 'Imam Ahmad ibn Hanbal',
      'hadiths': '30,000+',
      'color': Colors.brown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HADITH BOOKS'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hadithBooks.length,
        itemBuilder: (context, index) {
          final book = hadithBooks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: Text(book['name'] as String),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author: ${book['author']}'),
                        const SizedBox(height: 8),
                        Text('Total Hadiths: ${book['hadiths']}'),
                        const SizedBox(height: 16),
                        const Text('Hadith collection will be displayed here.'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (book['color'] as Color).withOpacity(0.5),
                      (book['color'] as Color).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: book['color'] as Color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.menu_book,
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
                            book['name'] as String,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: (book['color'] as Color).withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            book['author'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${book['hadiths']} Hadiths',
                            style: TextStyle(
                              fontSize: 12,
                              color: (book['color'] as Color).withOpacity(0.7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: book['color'] as Color,
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
