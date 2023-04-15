import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/interfaces/failures.dart';

SnackbarController failureSnack(Failure failure, Function() retry) => Get.snackbar(
      'مشکلی پیش آمده',
      'ارتباط با سرور دچار مشکل شد',
      backgroundColor: Get.theme.colorScheme.surfaceVariant,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
      padding: EdgeInsets.fromLTRB(24, 8, 16, 8),
      margin: EdgeInsets.all(16),
      duration: Duration(days: 365),
      mainButton: TextButton(
        onPressed: () {
          Get.closeAllSnackbars();
          retry();
        },
        child: Text('تلاش مجدد'),
      ),
    );
