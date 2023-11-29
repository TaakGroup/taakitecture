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
  Future<Model> create({BaseModel? data, String? params}) {
    throw UnimplementedError();
  }

  @override
  Future<Model> delete([String? params]) {
    throw UnimplementedError();
  }

  @override
  Future<Model> find([String? params]) {
    throw UnimplementedError();
  }

  @override
  Future<Model> update({required BaseModel? data, String? params}) {
    throw UnimplementedError();
  }

  @override
  uploadFile({required formData, String? params}) {
    throw UnimplementedError();
  }
}
