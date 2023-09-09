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
  final List<User> volunteers = [
    User(name: "Umar Hayyat", category: "Volunteer"),
    User(name: "Muhammad Furqan", category: "Volunteer"),
    User(name: "Ammar Ul Haq", category: "Volunteer"),
    User(name: "Imran Khan", category: "Volunteer"),
  ];

  List<User> filteredVolunteers = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredVolunteers = volunteers;
  }

  void filterSearchResults(String query) {
    List<User> results = [];
    if (query.isNotEmpty) {
      volunteers.forEach((volunteer) {
        if (volunteer.name.toLowerCase().contains(query.toLowerCase())) {
          results.add(volunteer);
        }
      });
    } else {
      results = List.from(volunteers);
    }

    setState(() {
      filteredVolunteers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteers'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(right: 500, left: 500, top: 100, bottom: 50),
        child: Container(
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
                  decoration: InputDecoration(
                    hintText: "Search Volunteers...",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredVolunteers.length,
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
                          filteredVolunteers[index].name,
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
                                    Icon(Icons.food_bank_rounded),
                                    SizedBox(width: 8.0),
                                    Text("Requests"),
                                  ],
                                ),
                                value: "Requests",
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
                              case "Requests":
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
