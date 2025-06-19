class CanopyEntryModel {
  final String imagePath;
  final dynamic image;
  final double coverage;
  final double latitude;
  final double longitude;
  final DateTime timestamp;

  CanopyEntryModel({
    required this.imagePath,
    required this.image,
    required this.coverage,
    required this.latitude,
    required this.longitude,
    required this.timestamp,
  });

  //TODO: Add toJson/fromJson if saving to local DB or file.
}
