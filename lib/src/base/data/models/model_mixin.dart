import 'dart:convert';
import 'package:taakitecture/src/base/data/models/base_model.dart';

mixin ModelMixin on BaseModel {
  void setProp(String key, value);

  Map<String, dynamic> get properties;

  @override
  Map<String, dynamic> toJson() => properties;

  Map<String, String> toParams() => properties.map((key, value) => MapEntry(key, value.toString()));

  BaseModel getInstance();

  @override
  fromJson(Map<String, dynamic> mapJson) {
    mapJson.forEach((key, value) => setProp(key, value));
    return this;
  }

  listFromJson(mapJson) {
    if (mapJson == null) return [];

    if (mapJson is String) mapJson = jsonDecode(mapJson);
    List<BaseModel> list = [];

    for (var item in mapJson) {
      BaseModel newObj = getInstance();
      list.add(newObj.fromJson(item));
    }

    return list;
  }

  copy([Map<String, dynamic>? jsonMap]) {
    dynamic newObj = getInstance();
    if (jsonMap == null) {
      properties.forEach((key, value) => newObj.setProp(key, value));
    } else {
      fromJson(jsonMap);
    }
    return newObj;
  }

  listToJson(List objects) {
    List<Map> list = [];

    for (final obj in objects) {
      list.add(obj.toJson());
    }

    return list;
  }
}
