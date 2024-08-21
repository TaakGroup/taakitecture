import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:taakitecture/src/base/data/datasources/interface_datasource.dart';
import 'package:taakitecture/src/base/data/models/base_model.dart';

class BaseMockDataSource<Model extends BaseModel> extends IDataSource<Model> {
  final Model model;

  BaseMockDataSource({required this.model});

  Future<Map<String, dynamic>> loadJson(String path) async => json.decode(await rootBundle.loadString(path));

  Future<Model> fetch(String path) async => model.fromJson(await loadJson(path));

  @override
  Future<Model> create({Model? data, String? params, Map<String, String>? query}) {
    throw UnimplementedError();
  }

  @override
  Future<Model> delete([String? params, Model? data, Map<String, String>? query]) {
    throw UnimplementedError();
  }

  @override
  Future<Model> find([String? params, Map<String, String>? query]) {
    throw UnimplementedError();
  }

  @override
  Future<Model> update({required Model? data, String? params, Map<String, String>? query}) {
    throw UnimplementedError();
  }

  @override
  uploadFile({required formData, String? params, Map<String, String>? query, Function(int p1, int p2)? onSendProgress}) {
    throw UnimplementedError();
  }
}
