import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Status {
  initial,
  loading,
  success,
}

class RiverpodProvider extends StateNotifier<Status> {
  RiverpodProvider() : super(Status.initial);

  Future<void> fetchData() async {
    state = Status.loading;

    await Future.delayed(const Duration(seconds: 2));

    state = Status.success;
  }
}

final riverpodProvider =
    StateNotifierProvider.autoDispose((ref) => RiverpodProvider());
