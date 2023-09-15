import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  final String name;
  final String category;

  User({required this.name, required this.category});
}

class VolunteersCategory extends StatefulWidget {
  const VolunteersCategory({Key? key}) : super(key: key);

  @override
  _VolunteersCategoryState createState() => _VolunteersCategoryState();
}

class _VolunteersCategoryState extends State<VolunteersCategory> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> donators = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDonators = [];
  bool isLoading = false;
  void fetchVolunteers() {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestore.instance
        .collection('users')
        .where("userType", isEqualTo: "Volunteer")
        .get()
        .then((value) {
      print(value.docs);
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dat = value.docs;
      if (dat.isNotEmpty) {
        setState(() {
          donators = dat;
        });
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  TextEditingController searchController = TextEditingController();

  void filterSearchResults(String query) {
    print(" in filterSearchResults");

    filteredDonators.clear();
    // filteredDonators.addAll(donators);

    print(donators[0].data()['name']);
    filteredDonators.clear();
    if (query.isNotEmpty) {
      for (var donator in donators) {
        if (donator
            .data()['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          //setState(() {
          filteredDonators.add(donator);
          //  });
        }
      }
      setState(() {});
      print("filteredDonators: ${filteredDonators.length}}");
      // setState(() {
      //   filteredDonators = filteredDonators;
      // });
    } else {
      setState(() {
        filteredDonators.clear();
        filteredDonators.addAll(donators);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchVolunteers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volunteers'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 500, left: 500, top: 100, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: "Search Volunteers...",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDonators.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        filteredDonators[index].data()['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(filteredDonators[index].id)
                              .delete();
                          setState(() {
                            filteredDonators.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
