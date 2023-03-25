import 'package:taakitecture/src/base/data/datasources/base_mock_datasource.dart';
import 'package:taakitecture/taakitecture.dart';

class UserModel extends BaseModel {
  late String name;

  @override
  fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  @override
  Map<String, dynamic> toJson() => {'name': name};
}

class UserRemoteDataSource extends BaseRemoteDatasource {
  UserRemoteDataSource(IClient client) : super(client: client, model: UserModel(), path: '/user');
}

class UserMockDataSource extends MockDataSource<UserModel> {
  UserMockDataSource() : super(model: UserModel());

  @override
  Future<UserModel> find([String? params]) async => await fetch('fixture/user');
}

class UserRepository extends BaseRemoteRepository {
  UserRepository(super.baseRemoteDataSource, super.networkInfo);
}

class UserController extends BaseController {
  UserController(super.baseRemoteRepository);
}

class UserInjection extends Injection {
  @override
  initController() {
    singleton(UserController(sl<UserRepository>()));
  }

  @override
  initDataSource() {
    singleton(UserRemoteDataSource(sl()));
    singleton(UserMockDataSource());
  }

  @override
  initRepository() {
    singleton(UserRepository(sl<UserMockDataSource>(), sl()));
  }
}
