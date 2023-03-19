import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'data_bloc.rxb.g.dart';

/// A contract class containing all events of the DataBloC
abstract class DataBlocEvents {
  void fetchData();
}

/// A contract class containing all states of the DataBloC.
abstract class DataBlocStates {
  Stream<Result<void>> get data;
}

@RxBloc()
class DataBloc extends $DataBloc {
  @override
  Stream<Result<void>> _mapToDataState() => _$fetchDataEvent
      .switchMap(
        (value) => Future.delayed(const Duration(seconds: 1)).asResultStream(),
      )
      .shareReplay(maxSize: 1);
}
