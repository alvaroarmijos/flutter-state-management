// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'data_bloc.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class DataBlocType extends RxBlocTypeBase {
  DataBlocEvents get events;
  DataBlocStates get states;
}

/// [$Data] extended by the [Data]
/// {@nodoc}
abstract class $DataBloc extends RxBlocBase
    implements DataBlocEvents, DataBlocStates, DataBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [fetchData]
  final _$fetchDataEvent = PublishSubject<void>();

  /// The state of [data] implemented in [_mapToDataState]
  late final Stream<Result<void>> _dataState = _mapToDataState();

  @override
  Stream<Result<void>> get data => _dataState;

  Stream<Result<void>> _mapToDataState();

  @override
  void fetchData() => _$fetchDataEvent.add(null);

  @override
  DataBlocEvents get events => this;

  @override
  DataBlocStates get states => this;

  @override
  void dispose() {
    _compositeSubscription.dispose();
    super.dispose();
  }
}
