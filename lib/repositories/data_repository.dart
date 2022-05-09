import 'package:portfolio/models/firebase_data.dart';
import 'package:portfolio/utils/error.dart';
import 'package:portfolio/utils/managers/connectivity_manager.dart';
import 'package:portfolio/utils/managers/firebase_manager.dart';

import '../utils/constants.dart';
import 'dart:async';

class DataRepository {

  DataRepository() {
    _getData();
  }

  final _onNewData = StreamController<FirebaseData>.broadcast();//broadcast stream, multiple subscription

  Stream<FirebaseData> get onNewData => _onNewData.stream;

  _getData() async {
    try {
      bool value = await ConnectivityManager.shared.checkInternet();
      if (!value) {
        _onNewData.addError(NetworkException(Constants.internetErrorMessage));
      }
    } on NetworkException catch(_) {
      _onNewData.addError(NetworkException(Constants.internetCheckErrorMessage));
    }

    FirebaseManager.shared.getData("Data").listen((event) {
      if (event.snapshot.exists) {
        //trigger stream with data
        _onNewData.add(FirebaseData.fromJson(event.snapshot.value));
      } else {
        _onNewData.addError(NetworkException(Constants.contentNotFoundErrorMessage));
      }
    }).onError((error) {
      _onNewData.addError(NetworkException(Constants.networkErrorMessage));
    });
  }

  void dispose() {
    _onNewData.close();
  }
}
