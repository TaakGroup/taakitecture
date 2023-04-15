import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/interfaces/failures.dart';

SnackbarController getSnack(Failure failure, Function() retry) => Get.snackbar(
      'مشکلی پیش آمده',
      'ارتباط با سرور دچار مشکل شد',
      backgroundColor: Colors.blueGrey,
      mainButton: TextButton(
        onPressed: retry,
        child: Text('تلاش مجدد'),
      ),
    );
