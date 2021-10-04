import 'dart:async';

import 'package:contacts/src/data/repositories/contact_repository.dart';
import 'package:contacts/src/data/repositories/contact_repository_impl.dart';
import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/models/result.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final personViewModelProvider = ChangeNotifierProvider((ref) => PersonViewModel(ref.read));

class PersonViewModel extends ChangeNotifier {
  PersonViewModel(this._reader);
  final Reader _reader;
  late final ContactRepository _repository = _reader(contactRepositoryProvider);

  /// Result use case No.1
  Result<ContactModel>? _person;
  Result<ContactModel>? get person => _person;
  Future<void> fisrtContact() async {
    /// Result use case No.2
    _repository.fisrtContact().then((value) => _person = value).whenComplete(notifyListeners);
  }
}
