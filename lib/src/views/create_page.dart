import 'package:contacts/src/routes.dart';
import 'package:contacts/src/viewmodels/create_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreatePage extends HookWidget {
  const CreatePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final createdViewModel = context.read(createViewModelProvider);
    final createdForm = useProvider(createViewModelProvider.select((value) => value.form));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
          key: createdForm,
        child: Column(
          children: [
            TextFormField(
              onChanged: createdViewModel.onChangedName,
              decoration: const InputDecoration(label: Text('Name')),
              keyboardType: TextInputType.name,
              validator: (value) => value == null || value.isEmpty ? 'Requared' : null,
            ),
            TextFormField(
              onChanged: createdViewModel.onChangedPhone,
              decoration: const InputDecoration(label: Text('Phone')),
              keyboardType: TextInputType.phone,
              validator: (value) => value == null || value.isEmpty ? 'Requared' : null,
            ),
            TextFormField(
              onChanged: createdViewModel.onChangedEmail,
              decoration: const InputDecoration(label: Text('Email')),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value == null || value.isEmpty ? 'Requared' : null,
            ),
            ElevatedButton(
              onPressed: () {
                if (createdForm.currentState!.validate()) {
                  createdViewModel.onPressedCreate().then((value) {
                    return Navigator.of(context).pushReplacementNamed(Routes.root);
                  });
                }
              },
              child: const Text('Create contact'),
            ),
          ],
        ),
      ),
    );
  }
}
