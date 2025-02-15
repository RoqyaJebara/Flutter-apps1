import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Stream',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  StreamController<String> streamController = StreamController<String>();
  late Stream<String> dataStream;

  @override
  void initState() {
    super.initState();
    dataStream = streamController.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(
                        snapshot.data ?? "Null Data",
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      )
                    : const Text(
                        "No Data",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      );
              },
            ),
            StreamBuilder<String>(
              stream: dataStream,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? Text(
                        snapshot.data ?? "Null Data",
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      )
                    : const Text(
                        "No Data",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      );
              },
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: textController,
              ),
            ),
            TextButton(
              onPressed: () {
                streamController.add(textController.text);
              },
              child: const Text(
                "Send To Stream",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
