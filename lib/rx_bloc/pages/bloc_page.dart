import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:state_management/rx_bloc/bloc/data_bloc.dart';

class RxBlocPage extends StatelessWidget {
  static const route = 'rx-bloc-page';

  const RxBlocPage({super.key});

  @override
  Widget build(BuildContext context) => RxBlocProvider<DataBlocType>(
        create: (context) => DataBloc(),
        child: const HomeBloc(),
      );
}

class HomeBloc extends StatelessWidget {
  const HomeBloc({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('RxBLoC Page')),
        body: Center(
          child: RxBlocBuilder<DataBlocType, Result<void>>(
            state: (bloc) => bloc.states.data,
            builder: (context, snapshot, _) {
              if (snapshot.data is ResultSuccess<void>) {
                return const Text('Success');
              }

              if (snapshot.data is ResultError<void>) {
                return const Text('Error');
              }

              if (snapshot.data is ResultLoading<void>) {
                return const CircularProgressIndicator();
              }

              return const Text('Press the Button');
            },
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () => context.read<DataBlocType>().events.fetchData(),
            ),
          ],
        ),
      );
}
