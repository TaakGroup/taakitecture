import 'package:taakitecture/src/base/data/datasources/base_remote_datasource.dart';
import 'package:taakitecture/taakitecture.dart';

import '../model/number_trivia_model.dart';

class NumberTriviaRemoteDataSource extends BaseRemoteDatasource {
  NumberTriviaRemoteDataSource(IClient client)
      : super(
          path: 'http://numbersapi.com/random',
          model: NumberTriviaModel(),
          client: client,
        );
}
