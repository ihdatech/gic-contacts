import 'package:contacts/src/routes.dart';
import 'package:contacts/src/viewmodels/loading_view_model.dart';
import 'package:contacts/src/viewmodels/person_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PersonPage extends HookWidget {
  const PersonPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final personViewModel = context.read(personViewModelProvider);
    final personSelected = useProvider(personViewModelProvider.select((value) => value.person));
    final snapshot = useFuture(
      useMemoized(() {
        return context.read(loadingViewModelProvider).whileLoading(personViewModel.fisrtContact);
      }, [personSelected?.toString()]),
    );
    Widget body = const SizedBox();
    if (snapshot.connectionState == ConnectionState.waiting || personSelected == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = personSelected.when(
        success: (success) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(child: Icon(Icons.person)),
              ),
              TextFormField(
                initialValue: success.name,
                decoration: const InputDecoration(label: Text('Name')),
                enabled: false,
              ),
              TextFormField(
                initialValue: success.phone,
                decoration: const InputDecoration(label: Text('Phone')),
                enabled: false,
              ),
              TextFormField(
                initialValue: success.email,
                decoration: const InputDecoration(label: Text('Email')),
                enabled: false,
              ),
            ],
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
        onRefresh: personViewModel.fisrtContact,
        child: body,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(Routes.edit),
        tooltip: 'Edit contact',
        label: const Text('Edit contact'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
