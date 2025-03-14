import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My First App",
      home: ListViewScreen(),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView va Scrollbar bilan ishlash')),
      body: Scrollbar(
        thickness: 10, // Scrollbar qalinligi
        radius: Radius.circular(5), // Scrollbar yumaloqligi
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.circle, color: Colors.red), // Chap tarafda ikonka
              title: Text('Element ${index + 1}'),
              subtitle: Text('Bu ${index + 1}-element'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue), // O‘ng tomonda ikonka
              onTap: () {
                // List elementga bosilganda dialogni ochish
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Element'),
                      content: Text('Element ${index + 1} bosilgan!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Dialogni yopish
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
