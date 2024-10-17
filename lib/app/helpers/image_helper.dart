import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:mime/mime.dart';

class ImageConstants {
  static final ImageConstants constants = ImageConstants._();
  factory ImageConstants() => constants;
  ImageConstants._();

  dynamic convertToBase64(String filePath) async {
    final mimeType = lookupMimeType(filePath) ?? 'image/png';
    final fileBytes = await File(filePath).readAsBytes();
    final base64String = base64Encode(fileBytes);
    final base64WithMime = 'data:$mimeType;base64,$base64String';
    return base64WithMime;
  }

  dynamic decodeBase64(String encoded) {
    if (encoded.contains(';base64')) {
      var parts = encoded.split(';');
      encoded = parts[1];

      parts = encoded.split(',');
      encoded = parts[1];
    }

    Uint8List decoded = const Base64Decoder().convert(encoded);
    return decoded;
  }
}
