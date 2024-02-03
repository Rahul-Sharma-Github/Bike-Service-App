import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyServicesRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>?> getStream();
}
