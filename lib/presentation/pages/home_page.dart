import '../widget/sample_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Column(
        children: [
          Expanded(child: SampleWidget()),
          Center(
            child: Text('Welcome to the Home Page'),
          ),
        ],
      ),
    );
  }
}
