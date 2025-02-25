import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final Player player;
  late final VideoController controller;

  @override
  void initState() {
    super.initState();
    player = Player();
    controller = VideoController(player);

    _loadVideo();
  }

  Future<void> _loadVideo() async {
    String path = "asset:///assets/videos/VideoEjemplo.mp4";
    player.open(Media(path));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reproducción de Video")),
      body: Column(
        children: [
          Expanded(child: Video(controller: controller)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.replay_10),
                onPressed: () => player.seek(
                  Duration(seconds: player.state.position.inSeconds - 10),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () => player.pause(),
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () => player.play(),
              ),
              IconButton(
                icon: const Icon(Icons.forward_10),
                onPressed: () => player.seek(
                  Duration(seconds: player.state.position.inSeconds + 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
