import 'dart:io';

import 'package:app/extensions/flutter_ext.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileCompressor {
  Future<List<File>> compressMultipleImage(List<File> files) async {
    List<File> images = [];
    if (!files.haveList) return images;
    for (File item in files) {
      var image = await compressSingleImage(item);
      if (image != null) images.add(image);
    }
    return images;
  }

  Future<File?> compressSingleImage(File file) async {
    var filePath = file.absolute.path;
    var lastIndex = filePath.lastIndexOf(RegExp('.jp'));
    var splitPath = filePath.substring(0, lastIndex);
    var targetPath = '${splitPath}_target${filePath.substring(lastIndex)}';
    var compressedFile = await _compressImage(file, targetPath);
    // var compressedFile = await FlutterImageCompress.compressAndGetFile(file.absolute.path, targetPath, quality: 100);
    // print(await compressedFile!.length() / 1024);
    // if (compressedFile == null) return null;
    return compressedFile;
  }
  // if (kDebugMode) print(file.path);
  // var compressedFile = await FlutterImageCompress.compressAndGetFile(file.absolute.path, targetPath, quality: 100);
  // if (kDebugMode) print('file length: ${compressedFile!.lengthSync()}');
  // if (kDebugMode) print('cropped length: ${await compressedFile?.length()}');
  // return compressedFile!;

  Future<File?> _compressImage(File file, String targetPath) async {
    File? imageFile;
    for (int quality = 0; quality <= 100; quality = quality + 10) {
      var image = await FlutterImageCompress.compressAndGetFile(file.absolute.path, targetPath, quality: 100 - quality);
      if (image != null && await image.length() <= 1024 * 1024) {
        imageFile = File(image.path);
        break;
      }
    }
    return imageFile;
  }
}
