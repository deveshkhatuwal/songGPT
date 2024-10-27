import 'package:flutter/material.dart';

import '../../core/widgets/audio_player.dart';

class SongDetailScreen extends StatelessWidget {
  final Map<String, String> song;

  const SongDetailScreen({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    String lyrics =
        "(Verse 1) In the shadows where secrets lie, Beneath a canvas of endless night, Whispered echoes of a haunting past, In the depths of silence, I find my cast.\n(Chorus) Shades of black, where dreams collide, A tapestry woven with the fears I hide, In the dark, I learn to see, The beauty in the void, it sets me free.\n(Verse 2) Like a raven soaring through the storm, I embrace the chaos, it becomes my form, In the stillness, I hear the call, Every shadow dances, I will not fall.\n(Chorus) Shades of black, where dreams collide, A tapestry woven with the fears I hide, In the dark, I learn to see, The beauty in the void, it sets me free.\"";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Song cover art
            Hero(
              tag: '${song['artist']}',
              child: SizedBox(
                width: size.width * 1,
                height: 200,
                child: Image.asset(
                  song['cover']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Song title and artist

            Text(
              song['title']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              song['artist']!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            // Play/pause button (no actual audio needed)

            const AudioPlayer(assetPath: 'audio.mp3'),
            // Like button with animation

            // Lyrics display
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    lyrics,
                    // Replace with actual lyrics
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}