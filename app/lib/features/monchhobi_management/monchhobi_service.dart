// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ToDoAddProvider extends ChangeNotifier {
//   List<String> _toDoElement = [];
//   List<String> get toDoElement => _toDoElement;

//   // get take_User_Input => null;
//   // final takeUserInput = TextEditingController();

//   ToDoAddProvider() {
//     loadPreference();
//   }

//   // void addTodoList(String element) async {
//   //   //   var sharedPref = await SharedPreferences.getInstance();

//   //   //   if (element.isNotEmpty) {
//   //   //     await sharedPref.setString('key', element);
//   //   //     _toDoElement.add(element);
//   //   //     notifyListeners();
//   //   //   }

//   //   //   await sharedPref.setStringList('todo', toDoElement);
  
//   // }

//     Future<void> addTodoList(String element) async {
//       if (element.isNotEmpty) {
//         _toDoElement.add(element);
//         notifyListeners();
//         print(_toDoElement);
//         await _saveToPreferences();
//       }
//     }

//   Future<void> _saveToPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('todo', _toDoElement);
//   }

//   // Load saved preference
//   // Future<void> loadPreference() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   // _isGrid = prefs.getBool('isGrid') ?? true; // Default to grid
//   //   _toDoElement = prefs.getStringList('todo')!;
//   //   notifyListeners();
//   // }

//   Future<void> loadPreference() async {
//     final prefs = await SharedPreferences.getInstance();
//     _toDoElement = prefs.getStringList('todo') ?? []; // Provide default value
//     print(_toDoElement);
//     notifyListeners();
//   }

//   void removeTodoList(int index) {
//     toDoElement.remove(toDoElement[index]);
//     notifyListeners();
//   }
// }













import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoAddProvider extends ChangeNotifier {
  List<String> _toDoElement = [];
  List<String> get toDoElement => _toDoElement;

  ToDoAddProvider() {
    loadPreference();
  }

  Future<void> addTodoList(String element) async {
    if (element.isNotEmpty) {
      _toDoElement.add(element);
      notifyListeners();
      print("Added: $_toDoElement");
      await _saveToPreferences();
    }
  }

  Future<void> removeTodoList(int index) async {
    if (index >= 0 && index < _toDoElement.length) {
      _toDoElement.removeAt(index);
      notifyListeners();
      print("Removed: $_toDoElement");
      await _saveToPreferences();
    }
  }

  Future<void> _saveToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todo', _toDoElement);
    print("Saved to Preferences: $_toDoElement");
  }

  Future<void> loadPreference() async {
    final prefs = await SharedPreferences.getInstance();
    _toDoElement = prefs.getStringList('todo') ?? [];
    print("Loaded from Preferences: $_toDoElement");
    notifyListeners();
  }
}