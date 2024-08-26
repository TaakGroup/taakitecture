import 'package:taakitecture/taakitecture.dart';
import '../model/number_trivia_model.dart';

class NumberTriviaMockDataSource extends BaseMockDataSource<NumberTriviaModel> {
  NumberTriviaMockDataSource() : super(model: NumberTriviaModel());

  @override
  Future<NumberTriviaModel> find([String? params, Map<String, dynamic>? query]) {
    return Future(
      () => NumberTriviaModel.fromMap(
        {
          'number': 13,
          'text': 'Some believe this is unlucky because one of those thirteen, Judas Iscariot, was the betrayer of Jesus Christ. From the 1890s, a number of English language sources relate the "unlucky" thirteen to an idea that at the Last Supper, Judas, the disciple who betrayed Jesus, was the 13th to sit at the table.',
        },
      ),
    );
  }
}
