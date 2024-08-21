abstract class IClient {
  get(String path, Map<String, String>? query);

  post(String path, {Map<String, dynamic>? data, Map<String, String>? query});

  put(String path, {Map<String, dynamic>? data, Map<String, String>? query});

  delete(String path, {Map<String, dynamic>? data, Map<String, String>? query});

  upload(String path, {required formData, Function(int, int)? onSendProgress, Map<String, String>? query});
}