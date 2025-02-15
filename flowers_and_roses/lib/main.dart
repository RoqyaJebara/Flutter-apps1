import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(
      // const
      MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Container listItem({required String flowerName}) {
  var img_arr = [
    'sadabahar.webp',
    'kanakambaram.webp',
    'sampangi.webp',
    'bijli.webp',
    'champa.webp',
    'mogra.webp',
    'orchid.webp',
    'samanthi.webp'
  ];
  return Container(
    margin: EdgeInsets.all(4.0),
    color: Colors.pink[100],
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              'assets/${img_arr[Random().nextInt(7)]}',
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(
              width: 21.0,
            ),
            Text(
              flowerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List<Widget> ll = [
    listItem(flowerName: "Sadabahar"),
    listItem(flowerName: "Kanakambaram"),
    listItem(flowerName: "Sampangi"),
    listItem(flowerName: "Bijli"),
    listItem(flowerName: "Champa"),
    listItem(flowerName: "Mogra"),
    listItem(flowerName: "Orchid"),
    listItem(flowerName: "Samanthi"),
    listItem(flowerName: "Phoolon"),
    listItem(flowerName: "African Daisy"),
    listItem(flowerName: "African Lily"),
    listItem(flowerName: "Alpenrose"),
    listItem(flowerName: "Amaryllis"),
    listItem(flowerName: "American Lotus")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          title: Text("Flowers And Roses"),
          backgroundColor: Colors.pink[300],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'add flower',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          ll.add(listItem(flowerName: myController.text));
                        });
                        print(ll.length.toString());
                        // print(myController.text);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: ll.map((e) => e).toList()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
