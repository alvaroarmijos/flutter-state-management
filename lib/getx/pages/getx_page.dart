import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management/getx/controller/controller.dart';

class GetXPage extends StatelessWidget {
  static const route = 'getx-page';

  const GetXPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeGetX();
  }
}

class HomeGetX extends StatefulWidget {
  const HomeGetX({super.key});

  @override
  State<HomeGetX> createState() => _HomeGetXState();
}

class _HomeGetXState extends State<HomeGetX> {
  late Controller c;

  @override
  void initState() {
    c = Get.put(Controller());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Page')),
      //It is best practice to put your Consumer widgets as deep in the tree as possible.
      //You don’t want to rebuild large portions of the UI just because some detail somewhere changed.
      body: GetX<Controller>(
        builder: (context) {
          if (c.state.value == Status.initial) {
            return const Center(child: Text('Press the Button'));
          }
          if (c.state.value == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (c.state.value == Status.success) {
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
            onPressed: () => c.fecthData(),
          ),
        ],
      ),
    );
  }
}
