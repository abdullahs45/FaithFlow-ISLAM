import 'package:adhan/adhan.dart' as adhan;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:hijri_date/hijri_date.dart';

class HomeController extends GetxController {
  var currentTime = ''.obs;
  var currentDate = ''.obs;
  var hijriDate = ''.obs;
  var hijriDateShort = ''.obs;
  var upcomingPrayer = 'Calculating...'.obs;

  static const double _defaultLatitude = 24.8607; // Karachi
  static const double _defaultLongitude = 67.0011;

  @override
  void onInit() {
    super.onInit();
    updateDateTime();
    // Update time every minute
    _updateUpcomingPrayer(DateTime.now());
    updateTimePeriodically();
  }

  void updateDateTime() {
    final now = DateTime.now();
    currentTime.value = DateFormat('hh:mm a').format(now);
    currentDate.value = DateFormat('EEEE, MMMM d, yyyy').format(now);

    // Calculate Hijri date
    final hijri = HijriDate.fromDate(now);
    final hijriMonthNames = [
      'Muharram',
      'Safar',
      'Rabi\' al-awwal',
      'Rabi\' al-thani',
      'Jumada al-awwal',
      'Jumada al-thani',
      'Rajab',
      'Sha\'ban',
      'Ramadan',
      'Shawwal',
      'Dhu al-Qi\'dah',
      'Dhu al-Hijjah',
    ];

    hijriDate.value =
        '${hijri.hDay} ${hijriMonthNames[hijri.hMonth - 1]} ${hijri.hYear} AH';
    hijriDateShort.value = '${hijri.hDay}/${hijri.hMonth}/${hijri.hYear} AH';
  }

  void updateTimePeriodically() {
    Future.delayed(const Duration(seconds: 60), () {
      updateDateTime();
      _updateUpcomingPrayer(DateTime.now());
      updateTimePeriodically();
    });
  }

  void _updateUpcomingPrayer(DateTime now) {
    final coordinates = adhan.Coordinates(_defaultLatitude, _defaultLongitude);
    final params =
        adhan.CalculationMethod.karachi.getParameters()
          ..madhab = adhan.Madhab.hanafi;

    final dateComponents = adhan.DateComponents.from(now);

    final prayerTimes = adhan.PrayerTimes(coordinates, dateComponents, params);

    final prayersInOrder = [
      adhan.Prayer.fajr,
      adhan.Prayer.sunrise,
      adhan.Prayer.dhuhr,
      adhan.Prayer.asr,
      adhan.Prayer.maghrib,
      adhan.Prayer.isha,
    ];

    adhan.Prayer? nextPrayer;
    DateTime? nextPrayerTime;

    for (final prayer in prayersInOrder) {
      final time = prayerTimes.timeForPrayer(prayer);
      if (time != null && time.isAfter(now)) {
        nextPrayer = prayer;
        nextPrayerTime = time;
        break;
      }
    }

    if (nextPrayer == null) {
      final tomorrow = now.add(const Duration(days: 1));
      final tomorrowComponents = adhan.DateComponents.from(tomorrow);
      final tomorrowPrayerTimes = adhan.PrayerTimes(
        coordinates,
        tomorrowComponents,
        params,
      );

      nextPrayer = adhan.Prayer.fajr;
      nextPrayerTime = tomorrowPrayerTimes.fajr;
    }

    final label = _prayerLabel(nextPrayer);
    final timeString = DateFormat('hh:mm a').format(nextPrayerTime!);

    upcomingPrayer.value = '$label · $timeString';
  }

  String _prayerLabel(adhan.Prayer prayer) {
    switch (prayer) {
      case adhan.Prayer.fajr:
        return 'Fajr';
      case adhan.Prayer.sunrise:
        return 'Sunrise';
      case adhan.Prayer.dhuhr:
        return 'Dhuhr';
      case adhan.Prayer.asr:
        return 'Asr';
      case adhan.Prayer.maghrib:
        return 'Maghrib';
      case adhan.Prayer.isha:
        return 'Isha';

      case adhan.Prayer.none:
        return 'No prayer';
    }
  }
}
