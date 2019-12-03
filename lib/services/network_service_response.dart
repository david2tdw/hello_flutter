class NetworkServieResponse<T> {
  T content;
  bool success;
  String message;

  NetworkServieResponse({
    this.content,
    this.success,
    this.message
  });
}

class MappedNetworkserviceResponse<T> {
  dynamic mappedResult;
  NetworkServieResponse<T> networkServieResponse;
  MappedNetworkserviceResponse({
    this.mappedResult,
    this.networkServieResponse
  });
}
