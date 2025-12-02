import 'package:faithflow_islam/Controllers/btm_nav_controller.dart';
import 'package:faithflow_islam/Controllers/home_controller.dart';
import 'package:faithflow_islam/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'quran_screen.dart';
import 'hadith_screen.dart';
import 'ibadat_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController navController = Get.find();
    Get.put(HomeController());

    final List<Widget> screens = [
      const HomePage(),
      const QuranScreen(),
      const HadithScreen(),
      const IbadatScreen(),
      const ProfileScreen(),
    ];

    return Obx(
      () => Scaffold(
        body: screens[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) => navController.changeIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green.shade700,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Quran'),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake),
              label: 'Ibadat',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text('Search results for: $query'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search Quran, Hadith, and more...'));
  }
}
