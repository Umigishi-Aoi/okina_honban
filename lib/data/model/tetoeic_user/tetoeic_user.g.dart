// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tetoeic_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TetoeicUserImpl _$$TetoeicUserImplFromJson(Map<String, dynamic> json) =>
    _$TetoeicUserImpl(
      name: json['name'] as String? ?? '',
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      score: json['score'] as int? ?? 0,
    );

Map<String, dynamic> _$$TetoeicUserImplToJson(_$TetoeicUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'score': instance.score,
    };
