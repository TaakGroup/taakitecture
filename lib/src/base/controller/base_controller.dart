import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:taakitecture/core/interfaces/failures.dart';
import '../data/models/base_model.dart';
import '../data/repositories/base_remote_repository.dart';

abstract class BaseController<Model> extends GetxController with StateMixin<Model> {
  final BaseRemoteRepository remoteRepository;
  Stopwatch stopwatch = Stopwatch();

  Duration minimumLoadingTime = Duration.zero;

  BaseController(this.remoteRepository);

  onResponse() {}

  onSuccess(Model result) => change(result, status: RxStatus.success());

  onFailure(String requestId, Failure failure, Function action) {}

  onLoading() => change(null, status: RxStatus.loading());

  Future<Either> baseRequest(Future Function() fromRepo, String requestId) async {
    onLoading();

    stopwatch.start();
    final either = await fromRepo();
    stopwatch.stop();

    onResponse();

    int remainMilliseconds = minimumLoadingTime.inMilliseconds - stopwatch.elapsedMilliseconds;
    if (remainMilliseconds > 0) await Future.delayed(Duration(milliseconds: remainMilliseconds));

    await either.fold(
      (failures) async => this.onFailure(requestId, failures, () => baseRequest(fromRepo, requestId)),
      (result) => onSuccess(result),
    );

    return either;
  }

  String requestId(x, y) => "$x$y";

  Future<Either> find([String? param, Map<String, String>? query]) {
    return baseRequest(
      () => remoteRepository.find(param, query),
      requestId(query, query),
    );
  }

  Future<Either> create({BaseModel? model, String? params, Map<String, String>? query}) {
    return baseRequest(
      () => remoteRepository.create(model, params, query),
      requestId(model, params),
    );
  }

  Future<Either> edit({BaseModel? model, String? params, Map<String, String>? query}) {
    return baseRequest(
      () => remoteRepository.update(model, params, query),
      requestId(model, params),
    );
  }

  Future<Either> delete([String? param, BaseModel? data, Map<String, String>? query]) {
    return baseRequest(
      () => remoteRepository.delete(param, data, query),
      requestId(param, data),
    );
  }

  Future<Either> uploadFile({required formData, String? params, Map<String, String>? query, Function(int, int)? onSendProgress}) {
    return baseRequest(
      () => remoteRepository.uploadFile(
        formData: formData,
        params: params,
        query: query,
        onSendProgress: onSendProgress,
      ),
      requestId(formData, params),
    );
  }
}
