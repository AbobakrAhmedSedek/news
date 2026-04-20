
sealed class RequestState<T> {}

class LoadingState <T> extends RequestState<T> {}

class ErrorState<T>  extends RequestState<T> {
  final String message;
  ErrorState(this.message);
}

class SuccessState<T> extends RequestState<T> {
  final T data;
  SuccessState(this.data);
}
