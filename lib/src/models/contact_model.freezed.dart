// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return _ContactModel.fromJson(json);
}

/// @nodoc
class _$ContactModelTearOff {
  const _$ContactModelTearOff();

  _ContactModel call(
      {required int id,
      required String name,
      required String phone,
      String? company,
      String? email,
      String? token}) {
    return _ContactModel(
      id: id,
      name: name,
      phone: phone,
      company: company,
      email: email,
      token: token,
    );
  }

  ContactModel fromJson(Map<String, Object> json) {
    return ContactModel.fromJson(json);
  }
}

/// @nodoc
const $ContactModel = _$ContactModelTearOff();

/// @nodoc
mixin _$ContactModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactModelCopyWith<ContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactModelCopyWith<$Res> {
  factory $ContactModelCopyWith(
          ContactModel value, $Res Function(ContactModel) then) =
      _$ContactModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String phone,
      String? company,
      String? email,
      String? token});
}

/// @nodoc
class _$ContactModelCopyWithImpl<$Res> implements $ContactModelCopyWith<$Res> {
  _$ContactModelCopyWithImpl(this._value, this._then);

  final ContactModel _value;
  // ignore: unused_field
  final $Res Function(ContactModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? company = freezed,
    Object? email = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ContactModelCopyWith<$Res>
    implements $ContactModelCopyWith<$Res> {
  factory _$ContactModelCopyWith(
          _ContactModel value, $Res Function(_ContactModel) then) =
      __$ContactModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String phone,
      String? company,
      String? email,
      String? token});
}

/// @nodoc
class __$ContactModelCopyWithImpl<$Res> extends _$ContactModelCopyWithImpl<$Res>
    implements _$ContactModelCopyWith<$Res> {
  __$ContactModelCopyWithImpl(
      _ContactModel _value, $Res Function(_ContactModel) _then)
      : super(_value, (v) => _then(v as _ContactModel));

  @override
  _ContactModel get _value => super._value as _ContactModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? company = freezed,
    Object? email = freezed,
    Object? token = freezed,
  }) {
    return _then(_ContactModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactModel implements _ContactModel {
  _$_ContactModel(
      {required this.id,
      required this.name,
      required this.phone,
      this.company,
      this.email,
      this.token});

  factory _$_ContactModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContactModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? company;
  @override
  final String? email;
  @override
  final String? token;

  @override
  String toString() {
    return 'ContactModel(id: $id, name: $name, phone: $phone, company: $company, email: $email, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContactModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.company, company) ||
                const DeepCollectionEquality()
                    .equals(other.company, company)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(company) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(token);

  @JsonKey(ignore: true)
  @override
  _$ContactModelCopyWith<_ContactModel> get copyWith =>
      __$ContactModelCopyWithImpl<_ContactModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactModelToJson(this);
  }
}

abstract class _ContactModel implements ContactModel {
  factory _ContactModel(
      {required int id,
      required String name,
      required String phone,
      String? company,
      String? email,
      String? token}) = _$_ContactModel;

  factory _ContactModel.fromJson(Map<String, dynamic> json) =
      _$_ContactModel.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  String? get company => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContactModelCopyWith<_ContactModel> get copyWith =>
      throw _privateConstructorUsedError;
}
