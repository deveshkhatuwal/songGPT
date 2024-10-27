import 'dart:async';

import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Map<String, String>> messages = [];
  bool isTyping = false;
  double progress = 0.0;

  String assistantResponse =
      "Oh, I'm absolutely thrilled to share \"Into the Blue\" with you! This enchanting Indie Pop track invites listeners on a dreamy journey through a world painted in serene shades of blue, where laughter dances on the waves and whispers of freedom fill the air. The lyrics beautifully capture the essence of exploration and the exhilaration of diving deep into the ocean of our dreams, embracing the currents that carry our hearts and souls. With a gentle yet uplifting melody, the chorus calls you to lose yourself in the rhythm of the waves, guiding you towards a place where you can truly be free. I can't wait for you to experience the magic of this song, where every note and lyric harmonizes to create a lush soundscape of tranquility and adventure! 🌊✨ Listen to it here: audio link.";
  final List<String> predefinedResponses = [
    "That's interesting! Tell me more.",
    "I love that idea!",
    "How do you feel about that?",
    "Can you explain further?",
    "What inspired this idea?",
  ];

  void sendMessage(String message) {
    messages.add({"user": message});
    isTyping = true;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _simulateProgress();
    });
  }

  void _simulateProgress() {
    progress = 0.0;
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (progress >= 1.0) {
        timer.cancel();
        messages.add({
          "bot":
              predefinedResponses[messages.length % predefinedResponses.length]
        });
        isTyping = false;
        generateSong();
      } else {
        progress += 0.1;
      }
      notifyListeners();
    });
  }

  void generateSong() {
    messages.add({
      "song":
          "(Verse 1) In the morning light, I see your face, A canvas painted in a twilight grace. The whispers of the wind, they call your name, In the hues of blue, nothing feels the same.\n(Chorus) Oh, shades of blue, where dreams collide, In the ocean of your heart, I want to reside. Every tear and every laugh, a beautiful hue, In this world of colors, I’m lost in you.\n(Verse 2) Underneath the stars, we dance so free, A symphony of silence, just you and me. The night wraps around, like a velvet shawl, In the depths of blue, I surrender it all.\n(Chorus) Oh, shades of blue, where dreams collide, In the ocean of your heart, I want to reside. Every tear and every laugh, a beautiful hue, In this world of colors, I’m lost in you.\n(Bridge) So let the colors swirl, let the moments flow, In the spectrum of our love, we’ll always glow. The world may fade, but we will stay true, Forever in the shades, forever in blue.\n"
    });
    notifyListeners();
  }
}