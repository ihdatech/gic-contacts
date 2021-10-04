// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContactModel _$$_ContactModelFromJson(Map<String, dynamic> json) =>
    _$_ContactModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      company: json['company'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_ContactModelToJson(_$_ContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'company': instance.company,
      'email': instance.email,
      'token': instance.token,
    };
