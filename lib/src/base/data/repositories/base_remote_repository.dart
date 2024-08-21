import 'package:dartz/dartz.dart';
import '../../../../core/interfaces/failures.dart';
import '../../../../core/interfaces/network_info.dart';
import '../datasources/interface_datasource.dart';
import '../models/base_model.dart';

abstract class BaseRemoteRepository<Model extends BaseModel> {
  final IDataSource remoteDataSource;
  final INetworkInfo networkInfo;

  BaseRemoteRepository(this.remoteDataSource, this.networkInfo);

  Future<Either<Failure, Model>> find([String? params, Map<String, String>? query]) async {
    if (await networkInfo.isConnected()) {
      try {
        dynamic result = await remoteDataSource.find(params, query);
        return Right(result);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Model>> create([BaseModel? model, String? params, Map<String, String>? query]) async {
    if (await networkInfo.isConnected()) {
      try {
        dynamic result = await remoteDataSource.create(data: model, params: params, query: query);
        return Right(result);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Model>> update([BaseModel? model, String? params, Map<String, String>? query]) async {
    if (await networkInfo.isConnected()) {
      try {
        dynamic result = await remoteDataSource.update(data: model, params: params, query: query);
        return Right(result);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Model>> delete([String? params, BaseModel? data, Map<String, String>? query]) async {
    if (await networkInfo.isConnected()) {
      try {
        dynamic result = await remoteDataSource.delete(params, data, query);
        return Right(result);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  Future<Either<Failure, Model>> uploadFile(
      {required formData, String? params, Map<String, String>? query, Function(int, int)? onSendProgress}) async {
    if (await networkInfo.isConnected()) {
      try {
        final result = await remoteDataSource.uploadFile(formData: formData, params: params, query: query, onSendProgress: onSendProgress);
        return Right(result);
      } on Exception {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
