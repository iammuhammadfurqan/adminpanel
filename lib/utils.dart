// a function that will get the count of 3 collections in firebase and return a map <String, int>

import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, int>> getCounts() async {
  Map<String, int> counts = {};
  // get the count of active users
  await FirebaseFirestore.instance
      .collection('users')
      //.where('status', isEqualTo: 'active')
      .get()
      .then((value) {
    print(value.docs.length);
    counts['activeUsers'] = value.docs.length;
  });
  // get the count of active orders
  await FirebaseFirestore.instance
      .collection('donations')
      .where('isActive', isEqualTo: true)
      .get()
      .then((value) {
    counts['activeOrders'] = value.docs.length;
  });
  // get the count of active requests
  await FirebaseFirestore.instance
      .collection('requests')
      .where('status', isEqualTo: 'active')
      .get()
      .then((value) {
    counts['activeRequests'] = value.docs.length;
  });
  // get the count of completed orders
  await FirebaseFirestore.instance
      .collection('requests')
      .where('status', isEqualTo: 'accepted')
      .get()
      .then((value) {
    counts['completedOrders'] = value.docs.length;
  });
  print(counts);
  return counts;
}
