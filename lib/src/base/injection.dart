import 'package:get/get.dart';

abstract class Injection implements Bindings {
  final sl = Get.find;
  final singleton = Get.put;
  final lazySingleton = Get.lazyPut;
  final factory = Get.create;

  initController();

  initRepository();

  initDataSource();

  @override
  void dependencies() {
    initDataSource();
    initRepository();
    initController();
  }
}
