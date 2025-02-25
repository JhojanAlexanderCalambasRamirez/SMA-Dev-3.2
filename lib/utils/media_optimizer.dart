import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VideoOptimizer {
  Future<String> optimizeVideo(String inputPath) async {
    final directory = await getApplicationDocumentsDirectory();
    final outputPath = '${directory.path}/optimized_video.mp4';

    try {
      final inputFile = File(inputPath);
      if (!inputFile.existsSync()) {
        throw Exception("El archivo de video no existe.");
      }

      await inputFile.copy(outputPath);
      return outputPath;
    } catch (e) {
      return inputPath;
    }
  }
}
