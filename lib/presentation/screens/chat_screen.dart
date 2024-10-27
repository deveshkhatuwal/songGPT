import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/theme_notifier.dart';
import '../../core/widgets/chatcard_audioplayer.dart';
import '../../data/providers/chat_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_textfield.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
    final TextEditingController controller = TextEditingController();
    log("rebuilded chat screen");
    return Scaffold(
      appBar: CustomAppbar(
        title: "Create Your Song",
      ),
      body: ChangeNotifierProvider(
        create: (_) => ChatProvider(),
        child: Consumer<ChatProvider>(
          builder: (context, chatProvider, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: chatProvider.messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == chatProvider.messages.length) {
                        return chatProvider.isTyping
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircularProgressIndicator(
                                      value: chatProvider.progress,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                        "Creating song... ${(chatProvider.progress * 100).toInt()}%"),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink();
                      }

                      bool isUser =
                          chatProvider.messages[index].containsKey("user");
                      bool isBot =
                          chatProvider.messages[index].containsKey("bot");
                      bool isSong =
                          chatProvider.messages[index].containsKey("song");

                      if (isSong) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: AppColors.cardGredient,
                                borderRadius: BorderRadius.circular(15)),
                            // color: AppColors.generatedMusicCard,
                            // elevation: 2,
                            child: Column(
                              children: [
                                const chatAudioPlayerCard(
                                    assetPath: "audio.mp3"),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: themeNotifier.isDarkMode
                                          ? AppColors.backgroundColorDark
                                          : AppColors.backgroundColorLight,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),

                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.mic,
                                          color: themeNotifier.isDarkMode
                                              ? const Color(0xFFD3D3CB)
                                              : AppColors.generatedMusicCard,
                                        ),
                                        Text(
                                          '  Lyrics',
                                          style: TextStyle(
                                              color: themeNotifier.isDarkMode
                                                  ? const Color(0xFFD3D3CB)
                                                  : AppColors
                                                      .generatedMusicCard,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      chatProvider.messages[index]["song"]!,
                                      style: const TextStyle(),
                                    ),

                                    // trailing: Row(
                                    //   mainAxisSize: MainAxisSize.min,
                                    //   children: [
                                    //     IconButton(
                                    //       icon: Icon(Icons.thumb_up),
                                    //       onPressed: () {
                                    //         // Handle like action
                                    //       },
                                    //     ),
                                    //     IconButton(
                                    //       icon: Icon(Icons.share),
                                    //       onPressed: () {
                                    //         // Handle share action
                                    //       },
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: themeNotifier.isDarkMode
                                          ? AppColors.backgroundColorDark
                                          : AppColors.backgroundColorLight,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.message,
                                          color: themeNotifier.isDarkMode
                                              ? const Color(0xFFD3D3CB)
                                              : AppColors.generatedMusicCard,
                                        ),
                                        Text(
                                          '  Assistant Response',
                                          style: TextStyle(
                                              color: themeNotifier.isDarkMode
                                                  ? const Color(0xFFD3D3CB)
                                                  : AppColors
                                                      .generatedMusicCard,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                      chatProvider.assistantResponse,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          decoration: BoxDecoration(
                            color: isUser
                                ? const Color(0xFFB2A7F4)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            isUser
                                ? chatProvider.messages[index]["user"]!
                                : chatProvider.messages[index]["bot"]!,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: isUser
                                    ? Colors.black
                                    : themeNotifier.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextfield(
                    hintText: 'Describe Your Song Idea...',
                    textEditingController: controller,
                    onTap: () {
                      chatProvider.sendMessage(controller.text);
                      controller.clear();
                    },
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: TextField(
                //           controller: _controller,
                //           decoration: InputDecoration(
                //             hintText: 'Type a message...',
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(8.0),
                //             ),
                //           ),
                //         ),
                //       ),
                //       IconButton(
                //         icon: Icon(Icons.send),
                //         onPressed: () {
                //           chatProvider.sendMessage(_controller.text);
                //           _controller.clear();
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}