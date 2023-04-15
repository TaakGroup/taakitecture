import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/interfaces/failures.dart';

SnackbarController failureSnack(Failure failure, Function() retry) {
  return Get.snackbar(
      'مشکلی پیش آمده',
      'ارتباط با سرور دچار مشکل شد',
      backgroundColor: Get.theme.colorScheme.surfaceVariant,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
      borderRadius: 12,
      padding: EdgeInsets.fromLTRB(24, 8, 16, 8),
      margin: EdgeInsets.only(bottom: 72, right: 16, left: 16),
      animationDuration: Duration(milliseconds: 500),
      mainButton: TextButton(
        onPressed: retry,
        child: Text('تلاش مجدد'),
      ),
    );
}
