import 'package:get/get.dart';
import 'package:taakitecture/core/interfaces/failures.dart';
import '../data/models/base_model.dart';
import '../data/repositories/base_remote_repository.dart';
import 'failed_service_queue.dart';

abstract class BaseController<Model> extends GetxController with StateMixin<Model> {
  final BaseRemoteRepository baseRemoteRepository;
  Stopwatch stopwatch = Stopwatch();

  Duration minimumLoadingTime = Duration.zero;

  BaseController(this.baseRemoteRepository);

  onSuccess(Model result) => change(result, status: RxStatus.success());

  onFailure(Failure failure, Function action) async => await FailedServiceQueue.addToReloadQueue(failure, action);

  onLoading() => change(null, status: RxStatus.loading());

  Future baseRequest(Future Function() fromRepo) async {
    onLoading();

    stopwatch.start();
    final resultOrFailure = await fromRepo();
    stopwatch.stop();

    int remainMilliseconds = minimumLoadingTime.inMilliseconds - stopwatch.elapsedMilliseconds;
    if (remainMilliseconds > 0) {
      await Future.delayed(Duration(milliseconds: remainMilliseconds));
    }

    await resultOrFailure.fold(
      (failures) async => onFailure(failures, () => baseRequest(fromRepo)),
      (result) => onSuccess(result.obj ?? result.list),
    );
  }

  Future find([String? query, Map<String, dynamic>? queryParameters]) => baseRequest(() => baseRemoteRepository.find(query));

  Future create({BaseModel? model, String? params}) => baseRequest(() => baseRemoteRepository.create(model, params));

  Future edit({BaseModel? model, String? params}) => baseRequest(() => baseRemoteRepository.update(model, params));

  Future delete([String? query]) => baseRequest(() => baseRemoteRepository.delete(query));
}
