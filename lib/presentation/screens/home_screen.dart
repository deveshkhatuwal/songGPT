import 'dart:developer';

import 'package:SongGPT/presentation/screens/songdetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/theme_notifier.dart';
import '../../data/providers/custom_audioplayer_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredSongs = [];

  final List<Map<String, String>> songs = [
    {
      'title': 'Pop',
      'artist': 'Artist 1',
      'cover': 'assets/images/coverimage.png'
    },
    {
      'title': 'Hip Hop',
      'artist': 'Artist 2',
      'cover': 'assets/images/coverimage.png'
    },
    {'title': 'Folk', 'artist': 'Artist 3', 'cover': 'assets/images/folk.png'},
    {
      'title': 'Drill',
      'artist': 'Artist 4',
      'cover': 'assets/images/drill.png'
    },
    {
      'title': "80's",
      'artist': 'Artist 5',
      'cover': 'assets/images/coverimage.png'
    },
    {
      'title': 'Bollywood',
      'artist': 'Artist 6',
      'cover': 'assets/images/bollywood.png'
    },
  ];

  @override
  void initState() {
    super.initState();
    _filteredSongs = songs;
    // _searchController.addListener(_filterSongs);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _filterSongs() {
    setState(() {
      _filteredSongs = songs
          .where((song) =>
              song['title']!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              song['artist']!
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: true);
    return ChangeNotifierProvider(
      create: (context) => AudioPlayerProvider(),
      child: Scaffold(
        appBar: CustomAppbar(),
        body: Column(
          children: [
            // Search bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: CustomTextfield(
                hintText: "Search Songs...",
                textEditingController: _searchController,
                onTap: () {
                  _filterSongs();
                  log("clicked");
                },
              ),
              // TextField(
              //   controller: _searchController,
              //   decoration: InputDecoration(
              //     hintText: 'Search songs...',
              //     prefixIcon: Icon(Icons.search),
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //   ),
              // ),
            ),
            // Grid/List of songs
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemCount: _filteredSongs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SongDetailScreen(song: _filteredSongs[index]),
                        ),
                      );
                    },
                    child: Hero(
                      tag: '${_filteredSongs[index]['artist']}',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          image: DecorationImage(
                            image: AssetImage(_filteredSongs[index]['cover']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 5),
                            child: Text(
                              _filteredSongs[index]['title']!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}