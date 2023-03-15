import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc_pattern/bloc/data_bloc.dart';

class BlocPage extends StatelessWidget {
  static const route = 'bloc-page';

  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(),
      child: const HomeBloc(),
    );
  }
}

class HomeBloc extends StatefulWidget {
  const HomeBloc({super.key});

  @override
  State<HomeBloc> createState() => _HomeBlocState();
}

class _HomeBlocState extends State<HomeBloc> {
  late DataBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<DataBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Page')),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          if (state is Initial) {
            return const Center(child: Text('Press the Button'));
          }
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Success) {
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
            onPressed: () => bloc.add(FetchDataEvent()),
          ),
        ],
      ),
    );
  }
}
