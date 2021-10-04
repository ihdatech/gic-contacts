import 'package:contacts/src/routes.dart';
import 'package:contacts/src/viewmodels/home_viewmodel.dart';
import 'package:contacts/src/viewmodels/loading_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read(homeViewModelProvider);
    final homeContacts = useProvider(homeViewModelProvider.select((value) => value.contacts));
    final snapshot = useFuture(
      useMemoized(() {
        return context.read(loadingViewModelProvider).whileLoading(homeViewModel.getContact);
      }, [homeContacts?.toString()]),
    );
    Widget body = const SizedBox();
    if (snapshot.connectionState == ConnectionState.waiting || homeContacts == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      body = homeContacts.when(
        success: (success) {
          return ListView.builder(
            itemCount: success.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                child: ElevatedButton(
                  onPressed: () {
                    homeViewModel.onPressedPersone(success[index].id).then((value) {
                      return Navigator.of(context).pushNamed(Routes.person);
                    });
                  },
                  onLongPress: () {
                    homeViewModel.onLongPressPersone(success[index].id).whenComplete(homeViewModel.getContact);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40.0,
                        child: Text(
                          success[index].name.substring(0, 1).toUpperCase(),
                          style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(success[index].name, style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white)),
                          Text(success[index].phone, style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white70)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
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
        onRefresh: homeViewModel.getContact,
        child: body,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(Routes.create),
        tooltip: 'Create contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
