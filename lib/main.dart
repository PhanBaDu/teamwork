import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/screens/home/home_screen.dart';
import 'src/screens/marketplace/marketplace_screen.dart';
import 'src/screens/notifications/notifications_screen.dart';
import 'src/screens/profile/profile_screen.dart';
import 'src/screens/menu/menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Clone',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US'),
      ],
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bag),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bars),
            label: 'Menu',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) => const HomeScreen());
          case 1:
            return CupertinoTabView(
                builder: (context) => const MarketplaceScreen());
          case 2:
            return CupertinoTabView(
                builder: (context) => const NotificationsScreen());
          case 3:
            return CupertinoTabView(
                builder: (context) => const ProfileScreen());
          case 4:
            return CupertinoTabView(builder: (context) => const MenuScreen());
          default:
            return CupertinoTabView(builder: (context) => const HomeScreen());
        }
      },
    );
  }
}
