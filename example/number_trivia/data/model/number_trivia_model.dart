import 'package:taakitecture/src/base/data/models/base_model.dart';

class NumberTriviaModel extends BaseModel {
  late String text;
  late int number;

  static fromMap(Map<String, dynamic> map) => NumberTriviaModel().fromJson(map);

  @override
  fromJson(Map<String, dynamic> json) {
    text = json['text'];
    number = (json['number'] as num).toInt();

    return this;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
