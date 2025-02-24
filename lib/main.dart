import 'package:flutter/material.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart'; // ✅ Importación correcta


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FFmpeg Test')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await FFmpegKit.execute("-version").then((session) async {
                final logs = await session.getOutput();
                print("FFmpeg Output: $logs");
              });
            },
            child: const Text("Test FFmpeg"),
          ),
        ),
      ),
    );
  }
}
