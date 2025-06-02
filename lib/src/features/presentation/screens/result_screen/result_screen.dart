import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/strings.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.result)),
    );
  }
}
