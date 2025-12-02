# FaithFlow_Islam

A full-stack Islamic mobile app built with Flutter, featuring both frontend and basic backend functionality. Designed as a personal self-learning project.

## Features

### Frontend
- Splash screen with gradient background
- Home dashboard with daily Ayat & Hadith
- Quran screen with full details (verses, revelation order, type, total verses)
- Separate Quran sections (Surah, Parah, Favourite)
- Hadith from Sihah-e-Sitta
- Ibadat guides & Tasbeeh counter
- Profile screen & Edit screen
- Beautiful UI with cards, search bar, and bottom navigation

### Backend / Functional
- **Upcoming prayer times** dynamically calculated
- **Tasbeeh counter** (increment, reset)
- **Islamic calendar** with Islamic date/month/year
- **Gregorian calendar** with dates and time
- **Favourite Ayah/Surah** shows separate section

## Tech Stack
- Flutter & Dart
- Local database (SQLite or JSON)
- GetX state management

## Screenshots

### Home Screen (Prayer Times & Calender) 
![Home Screen](assets/screenshots/home.jpg)
### Tasbeeh Counter
![Tasbeeh Counter](assets/screenshots/tasbeeh.jpg)
### Quran Details
![Quran Details](assets/screenshots/quran_surah.jpg)
![Quran Details](assets/screenshots/quran_parah.jpg)
![Quran Details](assets/screenshots/quran_favourite.jpg)
### Hadith Details 
![Hadith Details](assets/screenshots/hadith.jpg)
### Profile
![Profile](assets/screenshots/profile.jpg)
### Edit Profile 
![Edit Profile](assets/screenshots/editProfile.jpg)
### Ibadat
![Ibadat](assets/screenshots/ibadat.jpg)

## Installation
1. Clone the repo
2. `flutter pub get`
3. Run on emulator or device

## Future Improvements
- Audio recitation for Quran
- Integrate APIs for Quran and Hadith (all books)
- Push notifications for prayer times
- Dark mode & theme switching
- Bookmarking & favorites
