import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var userName = 'User'.obs;
  var email = 'user@example.com'.obs;
  var totalreadings = 0.obs;
  var daysActive = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loaduserData();
  }

  void loaduserData() async {
    final prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? 'User';
    email.value = prefs.getString('email') ?? 'user@example.com';
    totalreadings.value = prefs.getInt('totalreadings') ?? 0;
    daysActive.value = prefs.getInt('daysActive') ?? 0;
  }

  Future<void> updateProfile(String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('email', email);
    userName.value = name;
    this.email.value = email;
  }
}
