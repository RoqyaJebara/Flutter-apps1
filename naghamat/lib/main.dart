import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MusicWidget());
}

class MusicWidget extends StatelessWidget {
  void playMusic(int musicNumber) {
    AudioCache.instance = AudioCache(prefix: '');
    final player = AudioPlayer();
    // await player.play(UrlSource('music-1.mp3'));
    //await
    player.play(
      AssetSource('assets/music-$musicNumber.mp3'),
    ); // will immediately start playing
  }

  // Expanded myButton(
  //     {required int musicNumber,
  //     required Color buttonColor,
  //     required String buttonText}) {
  Expanded myButton(int musicNumber, Color buttonColor, String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1.0),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: buttonColor)))),
          onPressed: () {
            playMusic(musicNumber);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.music_note,
                  color: buttonColor,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  const MusicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          title: Text("Naghamat"),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // myButton(
            //     musicNumber: 1,
            //     buttonColor: Colors.red,
            //     buttonText: "Samsung Galaxy"),

            myButton(1, Colors.red, "Samsung Galaxy"),
            myButton(2, Colors.green, "Samsung Note"),
            myButton(3, Colors.black, "Nokia"),
            myButton(4, Colors.orange, "iPhone 11"),
            myButton(5, Colors.blue, "Whatsapp"),
            myButton(6, Colors.purple, "Samsung S7"),
            myButton(7, Colors.black, "iPhone 6"),
          ],
        ),
      ),
    );
  }
}
