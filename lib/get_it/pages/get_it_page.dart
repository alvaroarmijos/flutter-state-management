import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:state_management/get_it/providers/get_it_provider.dart';

class GetItPage extends StatefulWidget {
  static const route = 'get-it-page';

  const GetItPage({super.key});

  @override
  State<GetItPage> createState() => _GetItPageState();
}

class _GetItPageState extends State<GetItPage> {
  @override
  void initState() {
    //At your start-up you register all the objects
    //you want to access later like this:
    GetIt.I.registerSingleton<GetItProvider>(GetItProvider());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeGetIt();
  }
}

class HomeGetIt extends StatelessWidget with GetItMixin {
  HomeGetIt({super.key});

  @override
  Widget build(BuildContext context) {
    //You could tell your view to rebuild
    //any time state changes with a simple call to watchOnly:
    final state =
        watchOnly((GetItProvider getItProvider) => getItProvider.state);

    return Scaffold(
      appBar: AppBar(title: const Text('GetIt Page')),
      body: Builder(
        builder: (context) {
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
            //After that you can access your GetItProvider class
            //from anywhere like this:
            onPressed: () => get<GetItProvider>().fecthData(),
          ),
        ],
      ),
    );
  }
}
