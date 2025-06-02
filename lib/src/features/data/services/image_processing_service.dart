import 'dart:io';
import 'package:image/image.dart' as img;

class ImageProcessingService {
  Future<double> calculateCanopyCoverage(String imagePath) async {
    final imageBytes = await File(imagePath).readAsBytes();
    final image = img.decodeImage(imageBytes);
    if (image == null) return 0.0;

    int totalPixels = image.width * image.height;
    int canopyPixels = 0;

    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        final pixel = image.getPixel(x, y);
        final brightness = img.getLuminance(pixel);
        if (brightness < 150) canopyPixels++; // threshold
      }
    }
    return (canopyPixels / totalPixels) * 100;
  }
}