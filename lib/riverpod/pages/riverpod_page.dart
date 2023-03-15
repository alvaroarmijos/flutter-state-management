import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/riverpod_provider.dart';

class RiverpodPage extends StatelessWidget {
  static const route = 'riverpod-page';

  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: HomeRiverpod(),
    );
  }
}

class HomeRiverpod extends ConsumerWidget {
  const HomeRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(riverpodProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Page')),
      //It is best practice to put your Consumer widgets as deep in the tree as possible.
      //You don’t want to rebuild large portions of the UI just because some detail somewhere changed.
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(riverpodProvider);
          if (state == Status.initial) {
            return const Center(child: Text('Press the Button'));
          }
          if (state == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state == Status.success) {
            return const Center(child: Text('Success'));
          }
          return Container();
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () => data.fetchData(),
          ),
        ],
      ),
    );
  }
}
