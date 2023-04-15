import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/interfaces/failures.dart';

SnackbarController failureSnack(Failure failure, Function() retry) => Get.snackbar(
      'مشکلی پیش آمده',
      'ارتباط با سرور دچار مشکل شد',
      backgroundColor: Get.theme.colorScheme.surfaceVariant,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: false,
      mainButton: TextButton(
        onPressed: () {
          Get.closeAllSnackbars();
          retry();
        },
        child: Text('تلاش مجدد'),
      ),
    );
