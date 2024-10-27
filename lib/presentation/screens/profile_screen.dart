import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for demonstration
    final likedSongs = [
      'Liked Song 1',
      'Liked Song 2',
      'Liked Song 3',
    ];
    final userGeneratedSongs = [
      'Generated Song 1',
      'Generated Song 2',
      'Generated Song 3',
    ];

    return Scaffold(
      appBar: CustomAppbar(
        title: "Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture and name
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profileimage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: ListTile(
                      title: Text(
                        'User Name', // Update with actual user name
                        style: TextStyle(
                            // color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '56', // Update with actual user name
                        style: TextStyle(
                            // color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Liked Songs list
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Liked Songs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: likedSongs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(likedSongs[index]),
                          leading: const Icon(Icons.music_note),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // User Generated Songs list
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Generated Songs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: userGeneratedSongs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(userGeneratedSongs[index]),
                          leading: const Icon(Icons.library_music),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}