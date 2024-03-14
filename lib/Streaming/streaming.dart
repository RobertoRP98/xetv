import "package:flutter/material.dart";
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
class streaming extends StatefulWidget {
  const streaming({super.key});

  @override
  State<streaming> createState() => _streamingState();
}

class _streamingState extends State<streaming> {
  late FlickManager flickManager;
  @override
  void initState(){
    super.initState();
    flickManager = FlickManager
    (videoPlayerController: VideoPlayerController.networkUrl
    (Uri.parse("https://stream-xevt.golsystems.com.mx/memfs/da936730-7d43-4c67-9701-6142b2766985.m3u8")));
  }
  @override
  
   @override
  void dispose() {
    super.dispose();
    flickManager.dispose(); // Detener la reproducción y liberar recursos
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar( 
        title: const Text('Transmisión en vivo'),
      ),
      body: Center( 
        child: AspectRatio(
          aspectRatio: 16/10,
          child: FlickVideoPlayer(flickManager: flickManager)),
      ),
    );
  }
}