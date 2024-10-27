import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/theme_notifier.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, this.title = 'SongGPT'});

  String? title;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);

    return AppBar(
      centerTitle: true,
      title: Text(
        title!,
        key: ValueKey(themeNotifier.isDarkMode),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
          icon: Icon(
              themeNotifier.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
          onPressed: () {
            themeNotifier.toggleTheme();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}