import 'dart:io';
import 'package:image/image.dart' as img;

class ImageProcessingService {
  Future<double> calculateCanopyCoverage(dynamic imagePath) async {
    img.Image? image = img.decodeImage(File(imagePath).readAsBytesSync());

    if (image == null) {
      throw Exception('Failed to decode image');
    }

    const int threshold = 110;

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
          image.setPixelRgb(x, y, 0, 0, 0); // Black
          canopyPixels++;
        } else {
          image.setPixelRgb(x, y, 255, 255, 255); // White
        }
      }
    }

    final double canopyCoverage = (canopyPixels / totalPixels) * 100;

    return canopyCoverage;
  }
}