import 'package:connectivity_plus/connectivity_plus.dart';

import '../constants.dart';
import '../error.dart';

class ConnectivityManager {
  //singleton implementation
  ConnectivityManager._privateConstructor(); //private constructor
  static ConnectivityManager? _shared; //shared instance
  static ConnectivityManager get shared {
    _shared ??= ConnectivityManager._privateConstructor();
    return _shared!;
  }

  Future<bool> checkInternet() async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        // I am connected to a mobile network or wifi.
        return true;
      } else {
        return false;
      }
    } catch (error, _) {
      throw NoInternetException(Constants.internetCheckErrorMessage);
    }
  }
}