import 'package:get/get.dart';
import 'package:taakitecture/src/base/controller/base_controller.dart';

import '../data/model/number_trivia_model.dart';

class NumberTriviaController extends BaseController<NumberTriviaModel> {
  NumberTriviaController(super.baseRemoteRepository);

  static NumberTriviaController get to => Get.find();

  @override
  void onInit() {
    minimumLoadingTime = Duration(seconds: 1);
    newNumber();
    super.onInit();
  }

  newNumber([int? number]) => find(number?.toString() ?? 'random');
}
