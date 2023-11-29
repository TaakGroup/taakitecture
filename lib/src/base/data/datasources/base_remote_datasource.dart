import '../../../../core/interfaces/client.dart';
import '../models/base_model.dart';
import 'interface_datasource.dart';

abstract class BaseRemoteDatasource<Model extends BaseModel> implements IDataSource<Model> {
  final IClient client;
  final String path;
  final Model model;

  BaseRemoteDatasource({required this.client, required this.path, required this.model});

  @override
  Future<Model> find([String? params]) async {
    final response = await client.get('$path/${params ?? ''}');
    return model.fromJson(response);
  }

  @override
  Future<Model> create({Model? data, String? params}) async {
    final response = await client.post('$path/${params ?? ''}', data: data?.toJson());
    return model.fromJson(response);
  }

  @override
  Future<Model> update({required Model? data, String? params}) async {
    final response = await client.put('$path/${params ?? ''}', data: data?.toJson());
    return model.fromJson(response);
  }

  @override
  Future<Model> delete([String? params]) async {
    final response = await client.delete('$path/${params ?? ''}');
    return model.fromJson(response);
  }

  @override
  uploadFile({required formData, String? params}) async {
    final response = await client.upload('$path/${params ?? ''}', formData: formData);
    return model.fromJson(response);
  }
}
