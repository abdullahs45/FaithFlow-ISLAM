import 'package:faithflow_islam/Controllers/home_controller.dart';
import 'package:faithflow_islam/Screens/home_screen.dart';
import 'package:faithflow_islam/Widgets/Cards_HomePage/ayatofday_card.dart';
import 'package:faithflow_islam/Widgets/Cards_HomePage/hadithofday_card.dart';
import 'package:faithflow_islam/Widgets/Cards_HomePage/islamic_calender_card.dart';
import 'package:faithflow_islam/Widgets/Cards_HomePage/time_&_date_card.dart';
import 'package:faithflow_islam/Widgets/Cards_HomePage/upcoming_prayer_card.dart';
import 'package:faithflow_islam/Widgets/prayer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FaithFlow ISLAM'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeDateCard(
              time: controller.currentTime,
              date: controller.currentDate,
            ),
            const SizedBox(height: 16),

            // Islamic Calendar Card with Hijri Date
            IslamicCalendarCard(
              hijriDate: controller.hijriDate,
              hijriDateShort: controller.hijriDateShort,
              onTap: () {},
            ),
            const SizedBox(height: 12),

            // Prayer Time Card
            UpcomingPrayerCard(
              title: "Upcoming Prayer",
              prayerName: controller.upcomingPrayer.value,
              icon: Icons.mosque,
              color: const Color.fromARGB(255, 207, 94, 74),
              onTap: () => upcomingPrayerDialog(context),
            ),
            const SizedBox(height: 12),

            // Ayat of the Day Card
            const AyatOfDayCard(),
            const SizedBox(height: 12),

            // Hadith of the Day Card
            const HadithOfDayCard(),
          ],
        ),
      ),
    );
  }
}
