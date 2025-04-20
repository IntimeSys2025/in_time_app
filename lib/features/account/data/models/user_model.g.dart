// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      mobile: json['mobile'] as String,
      additionalMobile: json['additional_mobile'] ??'',
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dateBirth: json['date_of_birth'] ?? '',
      gender: json['gender'] as String,
      token: json['token'] as String,
      rememberMe: json['remember_me'] as bool,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'additional_mobile': instance.additionalMobile,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dateBirth,
      'gender': instance.gender,
      'token': instance.token,
      'remember_me': instance.rememberMe,
    };
