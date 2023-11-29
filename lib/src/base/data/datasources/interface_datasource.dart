import '../models/base_model.dart';

abstract class IDataSource<Model extends BaseModel> {
  Future<Model> find([String? params]);

  Future<Model> create({Model? data, String? params});

  Future<Model> update({required Model? data, String? params});

  Future<Model> delete([String? params]);

  uploadFile({required formData, String? params});
}