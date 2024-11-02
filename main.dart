import 'package:flutter/material.dart';

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
  List<Map<String, String>> books = [
    {"title": "Book1", "writer": "Author1"},
    {"title": "Book2", "writer": "Author2"},
    {"title": "Book3", "writer": "Author3"},
    {"title": "Book4", "writer": "Author4"},
    {"title": "Book5", "writer": "Author5"},
    {"title": "Book6", "writer": "Author6"},
  ];

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
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.blue,
            leading: const Icon(Icons.book),
            title: Text(books[index]["title"]!),
            subtitle: Text(books[index]["writer"]!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _showBookDialog(context, index: index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      books.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

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
