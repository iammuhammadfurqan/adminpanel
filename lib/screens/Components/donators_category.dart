import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  final String name;
  final String category;

  User({required this.name, required this.category});
}

class DonatorsCategory extends StatefulWidget {
  const DonatorsCategory({Key? key}) : super(key: key);

  @override
  _DonatorsCategoryState createState() => _DonatorsCategoryState();
}

class _DonatorsCategoryState extends State<DonatorsCategory> {
  TextEditingController searchController = TextEditingController();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> donators = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredDonators = [];
  bool isLoading = false;
  void fetchDonators() {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestore.instance
        .collection('users')
        .where("userType", isEqualTo: "Donator")
        .get()
        .then((value) {
      print(value.docs);
      List<QueryDocumentSnapshot<Map<String, dynamic>>> dat = value.docs;
      if (dat.isNotEmpty) {
        setState(() {
          donators = dat;
          filteredDonators = donators;
        });
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDonators();
  }

  void filterSearchResults(String query) {
    print(" in filterSearchResults");
    //List<QueryDocumentSnapshot<Map<String, dynamic>>> dummyListData = [];
    //print donators lenght
    print(donators[0].data()['name']);

    if (query.isNotEmpty) {
      for (var donator in donators) {
        print(donator.data()['name']);
      }
      print("filteredDonators: ${filteredDonators.length}}");
      setState(() {
        filteredDonators = filteredDonators;
      });
      return;
    } else {
      setState(() {
        filteredDonators.clear();
        filteredDonators.addAll(donators);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donators'),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 500, left: 500, top: 100, bottom: 20),
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                    },
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Search Donators...",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredDonators.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 500, left: 500),
                        child: Container(
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
                            trailing: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry>[
                                  const PopupMenuItem(
                                    value: "Donations",
                                    child: Row(
                                      children: [
                                        Icon(Icons.food_bank),
                                        SizedBox(width: 8.0),
                                        Text("Donations"),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: "Update User",
                                    child: Row(
                                      children: [
                                        Icon(Icons.edit),
                                        SizedBox(width: 8.0),
                                        Text("Update User"),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: "Delete User",
                                    child: Row(
                                      children: [
                                        Icon(Icons.delete),
                                        SizedBox(width: 8.0),
                                        Text("Delete User"),
                                      ],
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: "Block User",
                                    child: Row(
                                      children: [
                                        Icon(Icons.block),
                                        SizedBox(width: 8.0),
                                        Text("Block User"),
                                      ],
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (value) {
                                // Handle the option selected
                                switch (value) {
                                  case "Donations":
                                    break;
                                  case "Update User":
                                    // Implement update user functionality
                                    break;
                                  case "Delete User":
                                    // Implement delete user functionality
                                    break;
                                  case "Block User":
                                    break;
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
