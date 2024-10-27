import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_notifier.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key,
      required this.hintText,
      this.textEditingController,
      this.onTap});

  String hintText;
  TextEditingController? textEditingController;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: themeNotifier.isDarkMode
                      ? AppColors.textFieldTitleColorDark
                      : AppColors.textFieldTitleColorLight,
                ),
                prefixIcon: const Icon(
                  Icons.music_note_outlined,
                  color: Color(0xFF653BC8),
                ),
                contentPadding: EdgeInsets.zero,
                fillColor: themeNotifier.isDarkMode
                    ? AppColors.textFieldBackgroundColorDark
                    : AppColors.textFieldBackgroundColorLight,
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            // margin: EdgeInsets.only(left: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7748EC),
                    Color(0xFF987EFB),
                  ],
                ),
                borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(8),
            child: const ImageIcon(
              AssetImage(
                "assets/images/songicon.png",
              ),
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}