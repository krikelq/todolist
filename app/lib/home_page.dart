import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_list/features/edit_monchobi/edit_monchobi.dart';
import 'package:to_list/features/monchhobi_management/monchhobi_screen.dart';
import 'package:to_list/features/monchhobi_management/monchhobi_service.dart';

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {},
  );
  Widget continueButton = TextButton(
    child: Text("Continue"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content:
        Text("Would you like to continue learning how to use Flutter alerts?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Storage Permission Required"),
        content: Text("Please grant storage permission to download files."),
        actions: [
          TextButton(
            // Use TextButton instead of FlatButton
            child: const Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            // Use TextButton instead of FlatButton
            child: const Text("SETTINGS"),
            onPressed: () {
              openAppSettings(); // Open app settings
            },
          ),
        ],
      );
    },
  );
}

void openAppSettings() {
  print('object');
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<ToDoAddProvider>(context, listen: false).loadPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text('data'),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 8.0,
              ),
              padding: EdgeInsets.all(8.0),
              itemCount: Provider.of<ToDoAddProvider>(
                context,
              ).toDoElement.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (EditMonchobi())));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        Provider.of<ToDoAddProvider>(
                          context,
                        ).toDoElement[index],
                        style: TextStyle(fontSize: 18.0, color: Colors.black54),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (MyMonchobiPage())));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
