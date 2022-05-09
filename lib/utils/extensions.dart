import 'enums.dart';

extension Loadingstatus on LOADING_STATUS {
  bool get isSuccess => this == LOADING_STATUS.success;
  bool get isError => this == LOADING_STATUS.error;
  bool get isLoading => this == LOADING_STATUS.loading;
}