import 'package:flutter/material.dart';
import 'video_player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SMA 3.2 Developers"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoPlayerScreen()), // ✅ Eliminado const
            );
          },
          child: const Text("Ir a Reproductor de Video"),
        ),
      ),
    );
  }
}
