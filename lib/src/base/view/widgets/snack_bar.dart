import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/interfaces/failures.dart';

SnackbarController failureSnack(Failure failure, Function() retry) {
  late SnackbarController controller;

  controller = Get.snackbar(
    'مشکلی پیش آمده',
    'ارتباط با سرور دچار مشکل شد',
    backgroundColor: Get.theme.colorScheme.surfaceVariant,
    snackPosition: SnackPosition.BOTTOM,
    isDismissible: false,
    borderRadius: 12,
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    margin: EdgeInsets.only(bottom: Get.height * 0.1, right: 16, left: 16),
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(days: 365),
    mainButton: TextButton(
      onPressed: () {
        controller.close();
        retry();
      },
      style: Get.theme.textButtonTheme.style?.copyWith(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(left: 24),
        ),
      ),
      child: const Text('تلاش مجدد'),
    ),
  );

  return controller;
}
