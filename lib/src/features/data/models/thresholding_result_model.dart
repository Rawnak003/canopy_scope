import 'package:image/image.dart' as img;

class ThresholdingResultModel {
  final img.Image image;
  final double coverage;

  ThresholdingResultModel(this.image, this.coverage);
}
