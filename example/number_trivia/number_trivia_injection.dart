import 'package:taakitecture/taakitecture.dart';
import 'controller/number_trivia_controller.dart';
import 'data/datasources/number_trivia_mock_datasource.dart';
import 'data/repositories/number_trivia_repository.dart';

class NumberTriviaInjection extends Injection {
  @override
  initController() {
    singleton(NumberTriviaController(sl<NumberTriviaRepository>()));
  }

  @override
  initDataSource() {
    singleton<INetworkInfo>(NetworkInfo());
    singleton(NumberTriviaMockDataSource());
  }

  @override
  initRepository() {
    singleton(NumberTriviaRepository(sl<NumberTriviaMockDataSource>(), sl()));
  }
}
