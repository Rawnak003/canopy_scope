import 'dart:io';
import 'package:canopy_coverage/src/features/data/models/thresholding_result_model.dart';
import 'package:image/image.dart' as img;

ThresholdingResultModel adaptiveThresholdingFast(String imagePath) {
  final originalBytes = File(imagePath).readAsBytesSync();
  final original = img.decodeImage(originalBytes);

  if (original == null) {
    throw Exception('Failed to decode image');
  }

  final resized = img.copyResize(original, width: 800);
  final grayscale = img.grayscale(resized);

  final width = grayscale.width;
  final height = grayscale.height;

  const blockSize = 15;
  const c = 10;
  final halfBlock = blockSize ~/ 2;

  final output = img.Image(width: width, height: height);

  final integral = List.generate(height, (_) => List<int>.filled(width, 0));

  for (int y = 0; y < height; y++) {
    int rowSum = 0;
    for (int x = 0; x < width; x++) {
      final int pixelBrightness = img.getLuminance(grayscale.getPixel(x, y)).toInt();
      rowSum += pixelBrightness;
      integral[y][x] = rowSum + (y > 0 ? integral[y - 1][x] : 0);
    }
  }

  int canopyPixels = 0;
  final int totalPixels = width * height;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      final int x1 = (x - halfBlock).clamp(0, width - 1);
      final int y1 = (y - halfBlock).clamp(0, height - 1);
      final int x2 = (x + halfBlock).clamp(0, width - 1);
      final int y2 = (y + halfBlock).clamp(0, height - 1);

      final int area = (x2 - x1 + 1) * (y2 - y1 + 1);

      final int A = (x1 > 0 && y1 > 0) ? integral[y1 - 1][x1 - 1] : 0;
      final int B = (y1 > 0) ? integral[y1 - 1][x2] : 0;
      final int C = (x1 > 0) ? integral[y2][x1 - 1] : 0;
      final int D = integral[y2][x2];

      final int sum = D - B - C + A;
      final int mean = sum ~/ area;

      final int pixelBrightness = img.getLuminance(grayscale.getPixel(x, y)).toInt();


      if (pixelBrightness <= mean - c) {
        canopyPixels++;
        output.setPixelRgb(x, y, 0, 0, 0); // Black
      } else {
        output.setPixelRgb(x, y, 255, 255, 255); // White
      }
    }
  }

  final double coverage = (canopyPixels / totalPixels) * 100;
  return ThresholdingResultModel(output, coverage);
}
