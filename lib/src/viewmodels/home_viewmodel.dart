import 'dart:async';

import 'package:contacts/src/data/repositories/contact_repository.dart';
import 'package:contacts/src/data/repositories/contact_repository_impl.dart';
import 'package:contacts/src/models/contact_model.dart';
import 'package:contacts/src/models/result.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._reader);
  final Reader _reader;
  late final ContactRepository _repository = _reader(contactRepositoryProvider);

  /// Result use case No.1
  Result<List<ContactModel>>? _contacts;
  Result<List<ContactModel>>? get contacts => _contacts;
  Future<void> getContact() async {
    /// Result use case No.2
    _repository.getContact().then((value) => _contacts = value).whenComplete(notifyListeners);
  }

  Future<void> onPressedPersone(int value) async => _repository.setId(value).whenComplete(notifyListeners);

  Future<void> onLongPressPersone(int value) async {
    return _repository.setId(value).then((value) => _repository.deleteContact().whenComplete(notifyListeners));
  }
}
