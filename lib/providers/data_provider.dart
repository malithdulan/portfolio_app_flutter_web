import 'package:flutter/material.dart';
import 'package:portfolio/models/portfolio_data.dart';
import 'package:portfolio/repositories/data_repository.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/error.dart';

class DataProvider extends ChangeNotifier {
  final DataRepository _repository = DataRepository();

  PortfolioData? _data;

  PortfolioData? get data => _data;

  init() {
    _repository.onNewData.listen((firebaseData) {
      //trigger loading
      _data = PortfolioData(status: LOADING_STATUS.loading);
      notifyListeners();
      //wait for 2 seconds to send the firebase request
      Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () {
            _data =
                PortfolioData(data: firebaseData, status: LOADING_STATUS.success);
            notifyListeners();
          });
    }).onError((error) {
      _data = PortfolioData(
          status: LOADING_STATUS.error,
          errorMessage: (error as NetworkException).error);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }
}
