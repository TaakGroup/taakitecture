import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  Map<String, dynamic> toJson();

  fromJson(Map<String, dynamic> json);

  @override
  List<Object?> get props => toJson().values.toList();
}