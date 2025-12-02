import 'package:faithflow_islam/Controllers/quran_controller.dart';
import 'package:faithflow_islam/Widgets/Lists/favourite_list.dart';
import 'package:faithflow_islam/Widgets/Lists/parah_list.dart';
import 'package:faithflow_islam/Widgets/Lists/surah_list_widget.dart';
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
            surahList(controller),
            parahList(controller),
            favouriteList(controller),
          ],
        ),
      ),
    );
  }
}
