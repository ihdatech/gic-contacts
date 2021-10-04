import 'package:contacts/src/routes.dart';
import 'package:contacts/src/viewmodels/edit_viewmodel.dart';
import 'package:contacts/src/viewmodels/loading_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPage extends HookWidget {
  const EditPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final editViewModel = context.read(editViewModelProvider);
    final editForm = useProvider(editViewModelProvider.select((value) => value.form));
    final editPerson = useProvider(editViewModelProvider.select((value) => value.person));
    final snapshot = useFuture(
      useMemoized(() {
        return context.read(loadingViewModelProvider).whileLoading(editViewModel.fisrtContact);
      }, [editPerson?.toString()]),
    );
    Widget body = const SizedBox();
    if (snapshot.connectionState == ConnectionState.waiting || editPerson == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = editPerson.when(
        success: (success) {
          return Form(
          key: editForm,
            child: Column(
              children: [
                TextFormField(
                  initialValue: success.name,
                  onChanged: editViewModel.onChangedName,
                  decoration: const InputDecoration(label: Text('Name')),
                  keyboardType: TextInputType.name,
                  validator: (value) => value == null || value.isEmpty ? 'Requared' : null,
                ),
                TextFormField(
                  initialValue: success.phone,
                  onChanged: editViewModel.onChangedPhone,
                  decoration: const InputDecoration(label: Text('Phone')),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty ? 'Requared' : null,
                ),
                TextFormField(
                  initialValue: success.email,
                  onChanged: editViewModel.onChangedEmail,
                  decoration: const InputDecoration(label: Text('Email')),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.isEmpty ? 'Requared' : null,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (editForm.currentState!.validate()) {
                      editViewModel.onPressedEditContact().then((value) {
                        return Navigator.of(context).pushReplacementNamed(Routes.root);
                      });
                    }
                  },
                  child: const Text('Edit contact'),
                ),
              ],
            ),
          );
        },
        failure: (failure) {
          return Text(failure.message);
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: RefreshIndicator(
        onRefresh: editViewModel.fisrtContact,
        child: body,
      ),
    );
  }
}
