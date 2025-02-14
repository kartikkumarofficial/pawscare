import 'package:flutter/material.dart';
import 'package:pawscare/pages/AdoptionPage.dart';

class AdoptionCatalog extends StatefulWidget {
  @override
  _AdoptionCatalogState createState() => _AdoptionCatalogState();
}

class _AdoptionCatalogState extends State<AdoptionCatalog> {
  String filter = "All";

  final List<Map<String, dynamic>> animals = [
    {"name": "Boscow", "species": "Dog", "age": "2 years", "image": "assets/images/dog2_bg.png", "available": true},
    {"name": "Milo", "species": "Cat", "age": "1 year", "image": "assets/images/cat2.jpg", "available": false},
    {"name": "Luna", "species": "Rabbit", "age": "6 months", "image": "assets/images/rabbit.jpg", "available": true},
    {"name": "Max", "species": "Dog", "age": "3 years", "image": "assets/images/dog_main2.jpg", "available": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adoption Catalog"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search by name...",
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    enabled: true,
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: filter,
                  items: ["All", "Dog", "Cat", "Rabbit"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      filter = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: animals.length,
                itemBuilder: (context, index) {
                  final animal = animals[index];
                  return GestureDetector(
                    onTap: index == 0
                        ? () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdoptionPage()),
                    )
                        : null,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                              child: Image.asset(
                                animal['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  animal['name'],
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                                ),
                                Text("${animal['species']} - ${animal['age']}", style: TextStyle(fontSize: 14, color: Colors.black54)),
                                SizedBox(height: 4),
                                animal['available']
                                    ? Text("Available", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                                    : Text("Adopted", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
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


