import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management/mobx/stores/data_store.dart';

final dataStore = DataStore(); // Instantiate the store

class MobXPage extends StatelessWidget {
  static const route = 'mobx-page';

  const MobXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeMobX();
  }
}

class HomeMobX extends StatelessWidget {
  const HomeMobX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MobX Page')),
      //It is best practice to put your Consumer widgets as deep in the tree as possible.
      //You don’t want to rebuild large portions of the UI just because some detail somewhere changed.
      body: Observer(
        builder: (_) {
          if (dataStore.state == Status.initial) {
            return const Center(child: Text('Press the Button'));
          }
          if (dataStore.state == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (dataStore.state == Status.success) {
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
            onPressed: () => dataStore.fecthData(),
          ),
        ],
      ),
    );
  }
}
