import 'package:app/features/edit_monchobi/edit_monchobi_service.dart';
import 'package:app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class MyMonchobiPage extends StatelessWidget {
  MyMonchobiPage({super.key});

  final taskControllerTitle = TextEditingController();
  final taskControllerNote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Goal'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: taskControllerTitle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      labelText: 'Titel',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: taskControllerNote,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      labelText: 'Note',
                    ),
                  ),

                ],
              )),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<ToDoAddProvider>(context, listen: false)
                      .addTodoList(taskControllerTitle.text);
                  taskControllerTitle.clear();

                  Provider.of<ToDoAddProvider>(context, listen: false)
                      .addTodoList(taskControllerNote.text);
                  taskControllerNote.clear();

                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => (MyHomePage())));
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => (MyHomePage())));
                },
                child: const Text('Cencle'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Provider.of<ToDoAddProvider>(
                context,
              ).toDoElementt.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    style: TextStyle(fontFamily: 'assets/fonts/RobotoSlab-VariableFont_wght.ttf'),
                    Provider.of<ToDoAddProvider>(
                      context,
                    ).toDoElementt[index],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Provider.of<ToDoAddProvider>(context, listen: false)
                          .removeTodoList(index);
                    },
                    icon: Icon(Icons.delete),
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
