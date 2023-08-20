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

  Future baseRequest(Future Function() fromRepo, String requestId) async {
    onLoading();

    stopwatch.start();
    final resultOrFailure = await fromRepo();
    stopwatch.stop();

    onResponse();

    int remainMilliseconds = minimumLoadingTime.inMilliseconds - stopwatch.elapsedMilliseconds;
    if (remainMilliseconds > 0) {
      await Future.delayed(Duration(milliseconds: remainMilliseconds));
    }

    await resultOrFailure.fold(
      (failures) async => onFailure(requestId, failures, () => baseRequest(fromRepo, requestId)),
      (result) => onSuccess(result),
    );

    return resultOrFailure;
  }

  String requestId(x, y) => "$x$y";

  Future find([String? query, Map<String, dynamic>? queryParameters]) => baseRequest(
        () => remoteRepository.find(query),
        requestId(query, queryParameters),
      );

  Future create({BaseModel? model, String? params}) => baseRequest(
        () => remoteRepository.create(model, params),
        requestId(model, params),
      );

  Future edit({BaseModel? model, String? params}) => baseRequest(
        () => remoteRepository.update(model, params),
        requestId(model, params),
      );

  Future delete([String? query]) => baseRequest(
        () => remoteRepository.delete(query),
        requestId(query, null),
      );
}
