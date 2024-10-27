import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/providers/custom_audioplayer_provider.dart';
import '../theme/app_colors.dart';

class chatAudioPlayerCard extends StatelessWidget {
  final String assetPath;

  const chatAudioPlayerCard({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AudioPlayerProvider(),
      child: Consumer<AudioPlayerProvider>(
        builder: (context, audioProvider, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: const SizedBox(
                  width: 100,
                  height: 50,
                  child: Image(
                    image: AssetImage('assets/images/audio.png'),
                  ),
                ),
                title: const Text(
                  "Music",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                trailing: InkWell(
                  onTap: () {
                    Share.share("Check Out This Ai Generated Music");
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,

                    radius: 15,
                    child:
                        Icon(Icons.share, color: AppColors.generatedMusicCard),
                    // IconButton(
                    //   alignment: Alignment.center,
                    //   iconSize: 25,
                    //   icon:
                    //       Icon(Icons.share, color: AppColors.generatedMusicCard),
                    //   onPressed: () {
                    //     // Share.share('Check out this song: Color Blue');
                    //     Share.shareXFiles("assets/audio.mp3" as List<XFile>);
                    //   },
                    // ),
                  ),
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("AI Composer",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white)),
                    Text("Indian Pop",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                          audioProvider.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white),
                      onPressed: () {
                        if (audioProvider.isPlaying) {
                          audioProvider.pause();
                        } else {
                          audioProvider.play(assetPath);
                        }
                      },
                    ),
                    Text(
                      audioProvider
                          .formatDuration(audioProvider.currentPosition),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: audioProvider.audioDuration.inSeconds.toDouble(),
                        value:
                            audioProvider.currentPosition.inSeconds.toDouble(),
                        onChanged: (value) async {
                          await audioProvider
                              .seek(Duration(seconds: value.toInt()));
                        },
                      ),
                    ),
                    Text(
                      audioProvider.formatDuration(audioProvider.audioDuration),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    IconButton(
                      icon: Icon(
                        audioProvider.isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: audioProvider.toggleFavorite,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}