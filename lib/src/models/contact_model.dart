import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
abstract class ContactModel with _$ContactModel {
  factory ContactModel({
    required int id,
    required String name,
    required String phone,
    String? company,
    String? email,
    String? token,
  }) = _ContactModel;

  factory ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);
}