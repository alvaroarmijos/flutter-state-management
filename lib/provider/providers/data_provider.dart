import 'package:flutter/widgets.dart';

enum Status {
  initial,
  loading,
  success,
}

class DataProvider extends ChangeNotifier {
  /// Internal, private state of the dataProvider.
  Status _state = Status.initial;

  /// State of the dataProvider.
  Status get state => _state;

  /// Update State of the dataProvider. This is the only way to modify the
  /// dataProvider from the outside.
  void fecthData() async {
    _state = Status.loading;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _state = Status.success;
    notifyListeners();
  }
}
