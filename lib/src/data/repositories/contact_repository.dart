import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/models/result.dart';

abstract class ContactRepository {
  List<ContactModel>? get contacts;

  Future<void> setId(int? value);
  Future<void> setName(String? value);
  Future<void> setPhone(String? value);
  Future<void> setEmail(String? value);

  Future<Result<ContactModel>> fisrtContact();
  Future<Result<List<ContactModel>>> getContact();
  Future<Result<bool>> insertContact();
  Future<Result<ContactModel>> updateContact();
  Future<Result<int>> deleteContact();
}
