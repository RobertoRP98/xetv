
import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";
import "package:xetv/Radio/gradient.dart";

class radio extends StatefulWidget {
  const radio({super.key});

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
    AudioPlayer audioPlayer = new AudioPlayer();
    bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Radio en vivo'),
      ),
      body: gradient( 
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(image: AssetImage('logo.png'),),

              InkWell( 
                child: Icon( 
                  playing == false
                  ? Icons.play_circle_fill_outlined
                  : Icons.pause_circle_outline
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}