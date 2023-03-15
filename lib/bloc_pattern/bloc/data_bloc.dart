import 'package:flutter_bloc/flutter_bloc.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial()) {
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(
    FetchDataEvent event,
    Emitter<DataState> emit,
  ) async {
    emit(Loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(Success());
  }
}
