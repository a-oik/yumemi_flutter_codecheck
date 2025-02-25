class ApiResult<T> {
  final RequestResult result;
  final T data;
  final int? statasCode;

  ApiResult({required this.result, required this.data, this.statasCode});
}

enum RequestResult { success, apiError }
