// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      countryCode: json['country_code'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      userRole: (json['user_role'] as num).toInt(),
      userType: (json['user_type'] as num).toInt(),
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'country_code': instance.countryCode,
      'phone': instance.phone,
      'email': instance.email,
      'user_role': instance.userRole,
      'user_type': instance.userType,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };
