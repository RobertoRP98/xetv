
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
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

 

  void playAudio()async{
    var url = 'https://radio.golsystems.com.mx/8202/stream';
    if(playing){
      await audioPlayer.pause();
        setState(() {
          playing=false;
        });
    }else{
      var res = await audioPlayer.play(UrlSource(url));
        setState(() {
          playing = true;
        });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Radio en vivo'),
      ),
      body: gradient( 
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
           const Image(image: AssetImage('images/logo.png')),
              InkWell( 
                 onTap: () {
                  if (playing) {
                    audioPlayer.pause();
                    setState(() {
                      playing = false;
                    });
                  } else {
                    playAudio();
                    setState(() {
                      playing = true;
                    });
                  }
                },
                child: Icon( 
                  playing == false
                  ? Icons.play_circle_fill_outlined
                  : Icons.pause_circle_outline,
                  size: 100,
                  color: Colors.yellowAccent,

                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }


}

