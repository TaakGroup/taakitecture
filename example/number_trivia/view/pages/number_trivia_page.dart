import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/number_trivia_controller.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NumberTriviaController.to.obx(
        (numberTrivia) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(numberTrivia?.number.toString() ?? '', style: Theme.of(context).textTheme.displayLarge),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                numberTrivia?.text.toString() ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: 32),
            OutlinedButton(
              onPressed: NumberTriviaController.to.newNumber,
              child: Text('New Number'),
            ),
          ],
        ),
      ),
    );
  }
}
