import 'package:portfolio/models/firebase_data.dart';
import 'package:portfolio/utils/enums.dart';

class PortfolioData {
  FirebaseData? data;
  LOADING_STATUS? status;
  String? errorMessage;

  PortfolioData({this.data, this.status, this.errorMessage});
}
