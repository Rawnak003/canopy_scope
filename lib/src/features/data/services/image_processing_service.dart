import 'dart:io';
import 'package:image/image.dart' as img;

double calculateCanopyCoverageSync(String imagePath) {
  final bytes = File(imagePath).readAsBytesSync();
  final image = img.decodeImage(bytes);

  if (image == null) {
    throw Exception('Failed to decode image');
  }

  const int threshold = 128;

  int totalPixels = image.width * image.height;
  int canopyPixels = 0;

  for (var x = 0; x < image.width; x++) {
    for (var y = 0; y < image.height; y++) {
      final pixel = image.getPixel(x, y);
      final r = pixel.r;
      final g = pixel.g;
      final b = pixel.b;

      final brightness = ((r + g + b) / 3).round();

      if (brightness <= threshold) {
        image.setPixelRgb(x, y, 0, 0, 0);
        canopyPixels++;
      } else {
        image.setPixelRgb(x, y, 255, 255, 255);
      }
    }
  }

  return (canopyPixels / totalPixels) * 100;
}
