import 'package:get/get.dart';
import '../../../core/interfaces/failures.dart';

class FailedServiceQueue {
  static List<FailedService> listOfServicesNeedReloaded = [];
  static Function(Failure failure, Function() retry) displayFailureDialog = (Failure failure, Function() retry) {};

  static addToReloadQueue(failure, service) async {
    listOfServicesNeedReloaded.add(FailedService(service: service, failure: failure));
    if (!Get.isBottomSheetOpen!) {
      await displayFailureDialog(failure, _retry);
    }
  }

  static _retry() {
    for (FailedService failedService in listOfServicesNeedReloaded) {
      failedService.service.call();
    }
    listOfServicesNeedReloaded.clear();
  }
}

class FailedService {
  final Function service;
  final Failure failure;

  FailedService({required this.service, required this.failure});
}
