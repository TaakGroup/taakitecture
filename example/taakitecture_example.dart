import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'number_trivia/number_trivia_injection.dart';
import 'number_trivia/view/pages/number_trivia_page.dart';

void main() => runApp(NumberTriviaApp());

class NumberTriviaApp extends StatelessWidget {
  const NumberTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: NumberTriviaInjection(),
      home: NumberTriviaPage(),
    );
  }
}
