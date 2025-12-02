import 'package:flutter/material.dart';

class HadithOfDayCard extends StatelessWidget {
  const HadithOfDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade50],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Row(
              children: [
                Icon(Icons.menu_book, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Hadith of the Day',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              '"The best among you are those who learn the Quran and teach it."',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            SizedBox(height: 8),
            Text(
              'Sahih Bukhari',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
