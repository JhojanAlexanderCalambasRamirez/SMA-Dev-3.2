import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class VideoStorageManager {
  static final DefaultCacheManager _cacheManager = DefaultCacheManager();

  static Future<File?> getVideoFile(String url) async {
    try {
      FileInfo? fileInfo = await _cacheManager.getFileFromCache(url);
      if (fileInfo != null) {
        return fileInfo.file;
      }

      File file = await _cacheManager.downloadFile(url).then((fileInfo) => fileInfo.file);
      return file;
    } catch (e) {
      print("Error descargando video: $e");
      return null;
    }
  }

  static Future<String> getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
