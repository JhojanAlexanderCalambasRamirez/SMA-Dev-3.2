import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';

class VideoOptimizer {
  Future<void> optimizeVideo(String inputPath, String outputPath) async {
    String command = "-i $inputPath -vcodec libx265 -crf 28 $outputPath";
    await FFmpegKit.execute(command);
  }
}
