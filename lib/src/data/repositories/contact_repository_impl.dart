import 'dart:convert';

import 'package:contacts/src/data/remote/remote_data_source.dart';
import 'package:contacts/src/data/repositories/contact_repository.dart';
import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/models/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final contactRepositoryProvider = Provider((ref) => ContactRepositoryImpl(ref.read));

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl(this._reader);
  final Reader _reader;
  late final RemoteDataSource _dataSource = _reader(remoteDataSourceProvider);

  int? _id;
  String? _name;
  String? _phone;
  String? _email;

  List<ContactModel>? _contacts;

  @override
  List<ContactModel>? get contacts => _contacts;

  @override
  Future<void> setId(int? value) async => _id = value;

  @override
  Future<void> setName(String? value) async => _name = value;

  @override
  Future<void> setPhone(String? value) async => _phone = value;

  @override
  Future<void> setEmail(String? value) async => _email = value;

  @override
  Future<Result<ContactModel>> fisrtContact() {
    return Result.guardFuture(() => _dataSource.fisrtContact(id: _id!));
  }

  @override
  Future<Result<List<ContactModel>>> getContact() {
    return Result.guardFuture(() => _dataSource.getContact().then((value) => _contacts = value));
  }

  @override
  Future<Result<bool>> insertContact() {
    final body = <String, dynamic>{
      'id': '$_id',
      'name': '$_name',
      'phone': '$_phone',
      'email': '$_email',
    };
    return Result.guardFuture(() => _dataSource.insertContact(body: json.encode(body)));
  }

  @override
  Future<Result<ContactModel>> updateContact() {
    final body = <String, dynamic>{
      'id': '$_id',
      'name': '$_name',
      'phone': '$_phone',
      'email': '$_email',
    };
    return Result.guardFuture(() => _dataSource.updateContact(id: _id!, body: json.encode(body)));
  }

  @override
  Future<Result<int>> deleteContact() {
    return Result.guardFuture(() => _dataSource.deleteContact(id: _id!));
  }
}
