## Flutter Book List App
This is a simple Flutter app that allows users to manage a list of books. Users can add, update, and delete books, and each book has a random background color. The app also displays the title, author, and an edit/delete button for each book.

Features
Add a new book: Users can input a book title and author to add it to the list.
Update an existing book: Users can edit the title and author of any book.
Delete a book: Users can remove a book from the list.
Random background color: Each book has a random background color for visual appeal.
Clean UI with cards: Each book is displayed as a card with rounded corners and subtle shadows.
Floating action button: Users can tap the FAB to add a new book.

## Screenshots
### Initial
![Book List Screenshot](https://github.com/JarrarShahid/book-list/blob/main/Assets/Orignal.jpg)
### Adding
![Book List Screenshot](https://github.com/JarrarShahid/book-list/blob/main/Assets/Adding.jpg)
### Added
![Book List Screenshot](https://github.com/JarrarShahid/book-list/blob/main/Assets/Added.jpg)
### Deleted
![Book List Screenshot](https://github.com/JarrarShahid/book-list/blob/main/Assets/Deleted.jpg)
### Updating
![Book List Screenshot](https://github.com/JarrarShahid/book-list/blob/main/Assets/Updating.jpg)
### Updated
![Book List Screenshot](https://github.com/JarrarShahid/book-list/blob/main/Assets/Updated.jpg)

# Installation
To run this project locally, follow these steps:

## 1. Clone the repository:
git clone https://github.com/JarrarShahid/book-list.git
cd flutter-book-list


## 2. Install dependencies:
Make sure you have Flutter installed. If not, follow the official guide here.

Run the following command to install dependencies:
flutter pub get

## 3. Run the app:

You can now run the app with:
flutter run

This will launch the app on your emulator or connected device.

## Code Overview
Main File: lib/main.dart

Contains the core structure of the app with a HomeScreen widget that displays the book list and allows interaction.
MyApp is the root widget that initializes the app.
HomeScreen is a StatefulWidget that manages the list of books and handles adding, updating, and deleting books.
State Management: The app uses setState to manage the state of the books list. Whenever a user adds, edits, or deletes a book, setState is called to update the UI.

Random Colors: Each book is assigned a random background color when it's added to the list using _getRandomColor().

Dialogs: A dialog is used to add or edit books. It contains two TextField widgets for the title and author.

## Libraries Used
flutter/material.dart: Flutter's Material Design components.
dart:math: Used for generating random colors for the book items.

## Potential Improvements
Persistent Storage:
Currently, the app does not persist the book list. Implementing local storage (e.g., using shared_preferences or sqflite) would allow the app to save the list between app sessions, ensuring that users don't lose their data when the app is closed or reopened.

Form Validation:
Add form validation to ensure users enter both a title and a writer before adding or updating a book. This would prevent users from submitting incomplete or empty entries.

Sorting or Filtering:
Implement sorting or filtering functionality (e.g., by title or author) to enhance the user experience, especially if the book list becomes longer. This could make it easier for users to find specific books.

## License
This project is open-source and available under the MIT License.


