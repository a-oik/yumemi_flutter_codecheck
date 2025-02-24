class ApiResult<T> {
  final RequestResult result;
  final T data;

  ApiResult({required this.result, required this.data});
}

enum RequestResult { success, apiError }
