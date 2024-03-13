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
    flickManager = FlickManager(videoPlayerController: VideoPlayerController.networkUrl(Uri.parse("https://stream.golsystems.com.mx/memfs/8f81bb3e-b67a-42ca-a738-c7acc99fbb1c_output_0.m3u8")));
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
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