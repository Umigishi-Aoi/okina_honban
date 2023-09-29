import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;

  const factory Result.failure(Exception error) = Failure<T>;

  const Result._();

  static Result<T> guard<T>(T Function() body) {
    try {
      return Result.success(body());
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() future) async {
    try {
      return Result.success(await future());
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  bool get isSuccess =>
      when(success: (data) => true, failure: (error) => false);

  bool get isFailure =>
      when(success: (data) => false, failure: (error) => true);

  T? get data => when(success: (data) => data, failure: (error) => null);

  Exception? get exception =>
      when(success: (data) => null, failure: (error) => error);
}
