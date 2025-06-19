import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import '../../../../../core/app/app_spacing.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/strings.dart';
import '../../../data/models/canopy_entry_model.dart';
import '../../common_widgets/screen_background.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.entry});

  final CanopyEntryModel entry;

  @override
  Widget build(BuildContext context) {
    final pngBytes = img.encodePng(entry.image!);

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.result)),
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.pagePadding),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: AppSpacing.screenWidth(context),
                      height: AppSpacing.screenHeight(context) * 0.5,
                      child:  Image.memory(Uint8List.fromList(pngBytes), fit: BoxFit.contain,),
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: AppSpacing.screenWidth(context) * 0.2,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.remove),
                          ),
                        ),
                        SizedBox(
                          width: AppSpacing.screenWidth(context) * 0.2,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '110',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppSpacing.screenWidth(context) * 0.2,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.screenHeight(context) * 0.02),
                    ResultBarWidget(title: 'Coverage', value: '${entry.coverage.toStringAsFixed(2)}%',),
                    ResultBarWidget(title: 'Latitude', value: '${entry.latitude}'),
                    ResultBarWidget(title: 'Longitude', value: '${entry.longitude}'),
                    ResultBarWidget(title: 'Timestamp', value: '${entry.timestamp}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResultBarWidget extends StatelessWidget {
  const ResultBarWidget({
    super.key,
    required this.value, required this.title,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.screenHeight(context) * 0.005),
      height: AppSpacing.screenHeight(context) * 0.05,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.themeColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: AppSpacing.screenHeight(context) * 0.05,
            width: AppSpacing.screenWidth(context) * 0.35,
            decoration: BoxDecoration(
              color: AppColor.themeColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.whiteColor, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            width: AppSpacing.screenWidth(context) * 0.55,
            child: Center(
              child: Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
