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
  final List<User> donators = [
    User(name: "Umar Hayyat", category: "Donator"),
    User(name: "Muhammad Furqan", category: "Donator"),
    User(name: "Ammar Ul Haq", category: "Donator"),
    User(name: "Imran Khan", category: "Donator"),
  ];

  List<User> filteredDonators = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDonators = donators;
  }

  void filterSearchResults(String query) {
    List<User> results = [];
    if (query.isNotEmpty) {
      donators.forEach((donator) {
        if (donator.name.toLowerCase().contains(query.toLowerCase())) {
          results.add(donator);
        }
      });
    } else {
      results = List.from(donators);
    }

    setState(() {
      filteredDonators = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donators'),
      ),
      body: Column(
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
              decoration: InputDecoration(
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
                        filteredDonators[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.food_bank),
                                  SizedBox(width: 8.0),
                                  Text("Donations"),
                                ],
                              ),
                              value: "Donations",
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.edit),
                                  SizedBox(width: 8.0),
                                  Text("Update User"),
                                ],
                              ),
                              value: "Update User",
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.delete),
                                  SizedBox(width: 8.0),
                                  Text("Delete User"),
                                ],
                              ),
                              value: "Delete User",
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.block),
                                  SizedBox(width: 8.0),
                                  Text("Block User"),
                                ],
                              ),
                              value: "Block User",
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
