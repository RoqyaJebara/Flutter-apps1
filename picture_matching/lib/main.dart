import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Picture Matching"),
          // style: TextStyle(
          //   fontSize: 42.0,
          //   color: Colors.white,
          // ),
          backgroundColor: Colors.indigo[800],
        ),
        body: ImagePage(),
      ),
    ),
  );
}

//stless
//stful
//stfl
class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 1;
  int rightImageNumber = 2;

  void changeImage() {
    leftImageNumber = Random().nextInt(8) + 1;
    rightImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber
              ? 'Congratulations, you have succeeded'
              : "try again",
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Expanded(
              // flex: 2,
              child: TextButton(
                child: Image.asset('images/image-$leftImageNumber.png'),
                onPressed: () {
                  // print('The Left Button has been pressed');
                  setState(() {
                    changeImage();
                    // print(leftImageNumber);
                  });
                },
              ),
            ),
            Expanded(
              // flex: 1,
              child: TextButton(
                child: Image.asset('images/image-$rightImageNumber.png'),
                onPressed: () {
                  //  print('The Right Button has been pressed');
                  setState(() {
                    changeImage();
                    // print(rightImageNumber);
                    // print("rightImageNumber $rightImageNumber");
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
