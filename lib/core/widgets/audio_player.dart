import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/player_provider.dart';

class AudioPlayer extends StatelessWidget {
  final String assetPath;

  const AudioPlayer({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(assetPath),
      child: Consumer<PlayerProvider>(
        builder: (context, playerProvider, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                min: 0,
                max: playerProvider.audioDuration.inSeconds.toDouble(),
                value: playerProvider.currentPosition.inSeconds.toDouble(),
                onChanged: (value) {
                  final position = Duration(seconds: value.toInt());
                  playerProvider.seekAudio(position);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: playerProvider.isPlaying
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    onPressed: playerProvider.isPlaying
                        ? playerProvider.pauseAudio
                        : playerProvider.playAudio,
                  ),
                  AnimatedScale(
                    scale: playerProvider.isFavorited ? 1.5 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: IconButton(
                      icon: Icon(
                        playerProvider.isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: playerProvider.isFavorited
                            ? Colors.red
                            : Colors.grey,
                      ),
                      onPressed: playerProvider.toggleFavorite,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: playerProvider.shareAudio,
                  ),
                ],
              ),
              Text(
                "${playerProvider.formatDuration(playerProvider.currentPosition)} / ${playerProvider.formatDuration(playerProvider.audioDuration)}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        },
      ),
    );
  }
}