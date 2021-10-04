import 'package:contacts/src/routes.dart';
import 'package:contacts/src/views/create_page.dart';
import 'package:contacts/src/views/edit_page.dart';
import 'package:contacts/src/views/home_page.dart';
import 'package:contacts/src/views/person_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Routes.root,
      routes: {
        Routes.root: (context) => const HomePage(title: 'Home'),
        Routes.person: (context) => const PersonPage(title: 'Person'),
        Routes.create: (context) => const CreatePage(title: 'Create contact'),
        Routes.edit: (context) => const EditPage(title: 'Edit contact'),
      },
    );
  }
}
