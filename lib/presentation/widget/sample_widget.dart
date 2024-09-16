import '../providers/sample/sample_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleWidget extends ConsumerWidget {
  const SampleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sampleState = ref.watch(sampleNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sample')),
      body: Center(
        child: sampleState.when(
          data: (entity) => Text(entity.toString()),
          loading: CircularProgressIndicator.new,
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(sampleNotifierProvider.notifier)
              .fetchData('sample_endpoint');
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
