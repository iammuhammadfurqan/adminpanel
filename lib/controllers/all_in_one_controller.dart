import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class AllInOneController extends GetxController {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> donators =
      [].obs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDonators =
      [].obs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
}
