import 'package:SongGPT/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_notifier.dart';
import '../../data/providers/navigation_provider.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
// import 'profile_screen.dart';

class MainNavigation extends StatelessWidget {
  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, child) {
            return _pages[navigationProvider.currentIndex];
          },
        ),
        bottomNavigationBar: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, child) {
            return BottomAppBar(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              // notchMargin: 10,
              color: themeNotifier.isDarkMode
                  ? AppColors.primaryBackgroundDark
                  : AppColors.primaryBackgroundLight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Icon(Icons.home),
                    InkWell(
                      onTap: () => navigationProvider.setIndex(0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        width: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/home_icon.png",
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => navigationProvider.setIndex(1),
                      child: const SizedBox(
                        // padding: EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        width: 60,
                        child: Image(
                          image: AssetImage(
                            "assets/images/audio.png",
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => navigationProvider.setIndex(2),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 50,
                        width: 60,
                        child: const Image(
                          image: AssetImage(
                            "assets/images/profile.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}