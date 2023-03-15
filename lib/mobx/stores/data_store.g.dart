// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataStore on _DataStore, Store {
  late final _$stateAtom = Atom(name: '_DataStore.state', context: context);

  @override
  Status get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(Status value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fecthDataAsyncAction =
      AsyncAction('_DataStore.fecthData', context: context);

  @override
  Future<void> fecthData() {
    return _$fecthDataAsyncAction.run(() => super.fecthData());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
