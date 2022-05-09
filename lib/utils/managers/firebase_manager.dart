import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseManager {

  //singleton implementation
  FirebaseManager._privateConstructor(); //private constructor
  static FirebaseManager? _shared; //shared instance
  static FirebaseManager get shared {
    _shared ??= FirebaseManager._privateConstructor();
    return _shared!;
  }

  Future init() {
    return Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB4mG5yroyBd6pQW5x1bRRgviVGRIUjOV4",
        appId: "1:847209138421:web:be25aea2e9d00153b89dbc",
        messagingSenderId: "847209138421",
        projectId: "portfolio-1925a",
        databaseURL: "https://portfolio-1925a-default-rtdb.asia-southeast1.firebasedatabase.app",
      ),
    );
  }

  Stream<DatabaseEvent> getData(String databaseName) {
    final database = FirebaseDatabase.instance;
    return database.ref("Data").onValue;
  }
}