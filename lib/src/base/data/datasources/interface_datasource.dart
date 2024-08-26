import '../models/base_model.dart';

abstract class IDataSource<Model extends BaseModel> {
  Future<Model> find([String? params, Map<String, dynamic>? query]);

  Future<Model> create({Model? data, String? params, Map<String, String>? query});

  Future<Model> update({required Model? data, String? params, Map<String, String>? query});

  Future<Model> delete([String? params, Model? data, Map<String, String>? query]);

  uploadFile({required formData, String? params, Map<String, String>? query, Function(int, int)? onSendProgress});
}
