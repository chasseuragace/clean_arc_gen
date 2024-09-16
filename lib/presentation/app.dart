import '../main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'userlist/page/list.dart';

class DependencyWrapper extends ConsumerWidget {
  const DependencyWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedPreferencesAsyncValue = ref.watch(sharedPreferencesProvider);

    return sharedPreferencesAsyncValue.when(
      data: (sharedPreferences) => ProviderScope(
        overrides: [
          sharedPreferencesProvider
              .overrideWith((ref) => Future.value(sharedPreferences)),
        ],
        child: const MyApp(),
      ),
      loading: () => const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserlistListPage(),
    );
  }
}
