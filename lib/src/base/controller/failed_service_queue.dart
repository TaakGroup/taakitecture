import 'package:get/get.dart';
import '../../../core/interfaces/failures.dart';

mixin FailedServiceQueue {
  SnackbarController? snackbarController;
  final List<FailedService> _listOfServicesNeedReloaded = [];

  SnackbarController? failureDialog(Failure failure, Function() retry) {}

  addToReloadQueue(failure, service) async {
    _listOfServicesNeedReloaded.add(FailedService(service: service, failure: failure));
    snackbarController?.close();
    snackbarController = failureDialog(failure, _retry);
  }

  _retry() {
    for (FailedService failedService in _listOfServicesNeedReloaded) {
      failedService.service.call();
    }
    _listOfServicesNeedReloaded.clear();
  }
}

class FailedService {
  final Function service;
  final Failure failure;

  FailedService({required this.service, required this.failure});
}
