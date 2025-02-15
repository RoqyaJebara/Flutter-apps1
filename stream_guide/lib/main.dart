import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  // runApp(const StreamGuide());
  runApp(const StreamGuide());
}

class StreamGuide extends StatefulWidget {
  const StreamGuide({super.key});

  @override
  State<StreamGuide> createState() => _StreamGuideState();
}

class _StreamGuideState extends State<StreamGuide> {
  // StreamController<double> controller = StreamController();
  final StreamController<double> controller =
      StreamController<double>.broadcast();
  // StreamController<double>();
  StreamSubscription<double>? streamSubscription;

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stream Guide",
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MaterialButton(
                color: Colors.yellow,
                onPressed: () {
                  Stream<double> stream = controller.stream;
                  streamSubscription = stream.listen(
                    (value) {
                      print("value from the controller:$value");
                    },
                  );
                },

                //future
                // onPressed: () async {
                //   var value1 = await getDelayedRandomValue();
                //   var value2 = await getDelayedRandomValue();
                // },

                // onPressed: () async {
                //   getDelayedRandomValue().listen(
                //     (value) {
                //       print('Value from manualStream:${value}');
                //     },
                //   );
                // },
                child: const Text("Subscribe"),
              ),
              MaterialButton(
                color: Colors.blue[200],
                onPressed: () {
                  controller.add(12);
                },
                child: const Text("Emit Value"),
              ),
              MaterialButton(
                onPressed: () {
                  streamSubscription?.cancel();
                },
                color: Colors.red[200],
                child: const Text("UnSubscribe"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Stream<double> getDelayedRandomValue() async* {
  //   var random = Random();

  //   while (true) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     yield random.nextDouble();
  //   }
  // }

  // Future<double> getDelayedRandomValue() async {
  //   var random = Random();

  //   await Future.delayed(const Duration(seconds: 1));
  //   return random.nextDouble();
  // }
}

//storage error
// Error: ADB exited with exit code 1
// Performing Streamed Install

// adb: failed to install C:\development\flutter-apps\stream_guide\build\app\outputs\flutter-apk\app-debug.apk: Failure [INSTALL_FAILED_INSUFFICIENT_STORAGE]
// Error launching application on sdk gphone64 x86 64.


// Rx Observables vs Dart Streams 
//Event Emitters: Rx Observables are event emitters that can push data, errors, and completion signals.
// In contrast, Dart Streams only emit data events and can throw errors, but don't have a built-in completion signal