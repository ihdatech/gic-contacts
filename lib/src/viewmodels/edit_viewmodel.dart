import 'dart:async';

import 'package:contacts/src/data/repositories/contact_repository.dart';
import 'package:contacts/src/data/repositories/contact_repository_impl.dart';
import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/models/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final editViewModelProvider = ChangeNotifierProvider((ref) => EditViewModel(ref.read));

class EditViewModel extends ChangeNotifier {
  EditViewModel(this._reader);
  final Reader _reader;
  late final ContactRepository _repository = _reader(contactRepositoryProvider);

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  GlobalKey<FormState> get form => _form;

  /// Result use case No.1
  Result<ContactModel>? _person;
  Result<ContactModel>? get person => _person;
  Future<void> fisrtContact() async {
    /// Result use case No.2
    _repository.fisrtContact().then((value) => _person = value).whenComplete(notifyListeners);
  }

  Future<void> onChangedName(String? value) async => _repository.setName(value).whenComplete(notifyListeners);
  Future<void> onChangedPhone(String? value) async => _repository.setPhone(value).whenComplete(notifyListeners);
  Future<void> onChangedEmail(String? value) async => _repository.setEmail(value).whenComplete(notifyListeners);
  Future<void> onPressedEditContact() async => _repository.updateContact().then((value) => _person = value).whenComplete(notifyListeners);
}
