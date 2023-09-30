import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String english,
    required String japanese,
  }) = _Quiz;

  const Quiz._();
}
