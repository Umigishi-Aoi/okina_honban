// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tetoiec_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TetoiecUserImpl _$$TetoiecUserImplFromJson(Map<String, dynamic> json) =>
    _$TetoiecUserImpl(
      name: json['name'] as String? ?? '',
      id: json['id'] as String? ?? '',
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      score: json['score'] as int? ?? 0,
    );

Map<String, dynamic> _$$TetoiecUserImplToJson(_$TetoiecUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'score': instance.score,
    };
