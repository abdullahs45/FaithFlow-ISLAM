import 'package:faithflow_islam/Controllers/profile_controller.dart';
import 'package:faithflow_islam/Screens/edit_profile_screen.dart';
import 'package:faithflow_islam/Widgets/menu_item_widget.dart';
import 'package:faithflow_islam/Widgets/stat_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Get.to(() => const EditProfileScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade400, Colors.green.shade700],
                ),
              ),
              child: Obx(
                () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Text(
                          controller.userName.value.isNotEmpty
                              ? controller.userName.value[0].toUpperCase()
                              : '',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        controller.userName.value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.email.value,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Obx(
                    () => statCardWidget(
                      'Total Readings',
                      controller.totalreadings.value.toString(),
                      Icons.book,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => statCardWidget(
                      'Days Active',
                      controller.daysActive.value.toString(),
                      Icons.calendar_today,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  menuItemWidget('Settings', Icons.settings, () async {
                    // Example: Save user data to SharedPreferences
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString(
                      'userName',
                      controller.userName.value,
                    );
                    await prefs.setString('email', controller.email.value);
                    await prefs.setInt(
                      'totalreadings',
                      controller.totalreadings.value,
                    );
                    await prefs.setInt(
                      'daysActive',
                      controller.daysActive.value,
                    );

                    Get.snackbar(
                      'Settings Saved',
                      'User data stored locally using SharedPreferences.',
                      backgroundColor: Colors.green.shade100,
                      colorText: Colors.green.shade900,
                    );
                  }),
                  menuItemWidget('About', Icons.info, () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text('About'),
                        content: const Text('FaithFlow ISLAM\nVersion 1.0.0'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  }),
                  menuItemWidget('Help & Support', Icons.help, () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
