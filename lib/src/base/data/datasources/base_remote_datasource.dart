import '../../../../core/interfaces/client.dart';
import '../models/base_model.dart';
import 'interface_datasource.dart';

abstract class BaseRemoteDatasource<Model extends BaseModel> implements IDataSource<Model> {
  final IClient client;
  final String path;
  final Model model;

  BaseRemoteDatasource({required this.client, required this.path, required this.model});

  @override
  Future<Model> find([String? params, Map<String, dynamic>? query]) async {
    final response = await client.get('$path${params != null ? '/$params' : ""}', query);
    return model.fromJson(response);
  }

  @override
  Future<Model> create({Model? data, String? params, Map<String, String>? query}) async {
    final response = await client.post('$path/${params ?? ''}', data: data?.toJson(), query: query);
    return model.fromJson(response);
  }

  @override
  Future<Model> update({required Model? data, String? params, Map<String, String>? query}) async {
    final response = await client.put('$path/${params ?? ''}', data: data?.toJson(), query: query);
    return model.fromJson(response);
  }

  @override
  Future<Model> delete([String? params, Model? data, Map<String, String>? query]) async {
    final response = await client.delete('$path/${params ?? ''}', data: data?.toJson(), query: query);
    return model.fromJson(response);
  }

  @override
  uploadFile({required formData, String? params, Map<String, String>? query, Function(int, int)? onSendProgress}) async {
    final response = await client.upload('$path/${params ?? ''}', formData: formData, onSendProgress: onSendProgress, query: query);
    return model.fromJson(response);
  }
}
