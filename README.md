<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started
Import it
```dart
import 'package:taakitecture/taakitecture.dart';
```

## Usage

Data Sources
```dart
class UserRemoteDataSource extends BaseRemoteDatasource {
  UserRemoteDataSource(IClient client) : super(client: client, model: UserModel(), path: '/user');
}
```
```dart
class UserMockDataSource extends MockDataSource<UserModel> {
  UserMockDataSource() : super(model: UserModel());

  @override
  Future<UserModel> find([String? params]) async => await fetch('fixture/user');
}
```

Repository
```dart
class UserRepository extends BaseRemoteRepository {
  UserRepository(super.baseRemoteDataSource, super.networkInfo);
}
```

Controller
```dart
class UserController extends BaseController {
  UserController(super.baseRemoteRepository);
}
```

Dependency Injection
```dart
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
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
