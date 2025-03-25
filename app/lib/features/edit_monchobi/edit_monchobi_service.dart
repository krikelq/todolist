import 'package:flutter/material.dart';

class ToDoAddProvider extends ChangeNotifier {
  List<String> _toDoElement = [];
  List<String> get toDoElementt => _toDoElement;

  // get take_User_Input => null;
  // final takeUserInput = TextEditingController();

  void addTodoList(String element) {
    if (element.isNotEmpty) {
      _toDoElement.add(element);
      notifyListeners();
    }
  }

  void removeTodoList(int index) {
    toDoElementt.remove(toDoElementt[index]);
    notifyListeners();
  }

  void loadPreference() {}
}
