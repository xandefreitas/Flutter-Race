typedef Empty = Function();
typedef Loading = Function();
typedef Success<T> = Function(T data);
typedef Error = Function(String message, Exception? e);
typedef OrElse = Function();

abstract class AppState {
  dynamic when({
    Empty? empty,
    Loading? loading,
    Success? success,
    Error? error,
    required OrElse orElse,
  });

  static empty() => EmptyState();
  static loading() => LoadingState();
  static success<T>(T data) => SuccessState<T>(data);
  static error(String message, {Exception? e}) => ErrorState(message: message, e: e);
}

class EmptyState extends AppState {
  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required orElse}) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }
}

class LoadingState extends AppState {
  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required orElse}) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

class SuccessState<T> extends AppState {
  final T data;

  SuccessState(this.data);
  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required orElse}) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }
}

class ErrorState extends AppState {
  final String message;
  final Exception? e;

  ErrorState({required this.message, this.e});
  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required orElse}) {
    if (error != null) {
      return error(message, e);
    }
    return orElse();
  }
}
