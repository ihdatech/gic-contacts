import 'dart:async';

import 'package:contacts/src/data/repositories/contact_repository.dart';
import 'package:contacts/src/data/repositories/contact_repository_impl.dart';
import 'package:contacts/src/models/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createViewModelProvider = ChangeNotifierProvider((ref) => CreateViewModel(ref.read));

class CreateViewModel extends ChangeNotifier {
  CreateViewModel(this._reader);
  final Reader _reader;
  late final ContactRepository _repository = _reader(contactRepositoryProvider);

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  GlobalKey<FormState> get form => _form;

  /// Result use case No.1
  Result<bool>? _result;
  Result<bool>? get result => _result;

  Future<void> onChangedName(String? value) async => _repository.setName(value).whenComplete(notifyListeners);
  Future<void> onChangedPhone(String? value) async => _repository.setPhone(value).whenComplete(notifyListeners);
  Future<void> onChangedEmail(String? value) async => _repository.setEmail(value).whenComplete(notifyListeners);

  Future<void> onPressedCreate() async {
    /// Result use case No.2
    _repository.insertContact().then((value) => _result = value).whenComplete(notifyListeners);
  }
}
