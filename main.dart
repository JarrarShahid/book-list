import 'package:flutter/material.dart';
import 'dart:math'; // For generating random colors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Initial list of books with their titles and authors
  List<Map<String, dynamic>> books = [
    {"title": "Book 1", "writer": "Author 1", "color": _getRandomColor()},
    {"title": "Book 2", "writer": "Author 2", "color": _getRandomColor()},
    {"title": "Book 3", "writer": "Author 3", "color": _getRandomColor()},
    {"title": "Book 4", "writer": "Author 4", "color": _getRandomColor()},
    {"title": "Book 5", "writer": "Author 5", "color": _getRandomColor()},
    {"title": "Book 6", "writer": "Author 6", "color": _getRandomColor()},
  ];

  // Function to generate a random color for each book
  static Color _getRandomColor() {
    return Color(Random().nextInt(0xFFFFFF)).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showBookDialog(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16), 
              decoration: BoxDecoration(
                color: books[index]["color"], 
                borderRadius: BorderRadius.circular(12),  
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),  
                    blurRadius: 8,  
                    spreadRadius: 2,  
                    offset: Offset(0, 4), 
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15),
                leading: const Icon(Icons.book, color: Colors.white),
                title: Text(
                  books[index]["title"]!,
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold, 
                    fontSize: 18, 
                  ),
                ),
                subtitle: Text(
                  books[index]["writer"]!,
                  style: TextStyle(
                    color: Colors.white70, 
                    fontWeight: FontWeight.bold,
                    fontSize: 16, // Subtitle font size
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white),
                      onPressed: () => _showBookDialog(context, index: index),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          books.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Dialog to add or update a book
  Future<void> _showBookDialog(BuildContext context, {int? index}) {
    final isEditing = index != null;
    final titleController = TextEditingController(
      text: isEditing ? books[index]["title"] : '',
    );
    final writerController = TextEditingController(
      text: isEditing ? books[index]["writer"] : '',
    );

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: Text(isEditing ? "Update Book" : "Add Book"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: writerController,
                decoration: const InputDecoration(labelText: "Writer"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    writerController.text.isNotEmpty) {
                  setState(() {
                    final book = {
                      "title": titleController.text,
                      "writer": writerController.text,
                      "color": isEditing ? books[index]["color"] : _getRandomColor(), // Retain color if editing
                    };
                    if (isEditing) {
                      books[index] = book;
                    } else {
                      books.add(book);
                    }
                  });
                  Navigator.pop(ctx);
                }
              },
              child: Text(isEditing ? "Update" : "Add"),
            ),
          ],
        );
      },
    );
  }
}
