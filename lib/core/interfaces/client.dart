abstract class IClient {
  get(String path);

  post(String path, {Map<String, dynamic>? data});

  put(String path, {Map<String, dynamic>? data});

  delete(String path);
}