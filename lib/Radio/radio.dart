import "package:flutter/material.dart";
import 'package:just_audio/just_audio.dart';
import "package:xetv/Radio/gradient.dart";
class radio extends StatefulWidget {
  const radio({super.key});
  @override
  State<radio> createState() => _radioState();
}
class _radioState extends State<radio> {
  late AudioPlayer _audioPlayer;

  @override
  void initState(){
    super.initState();
    _audioPlayer = AudioPlayer()..setUrl('https://radio.golsystems.com.mx/8202/stream');
  }

  @override
  void dispose(){
    _audioPlayer.dispose();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio en vivo'),
      ),
      body: gradient(
        child: Controls(audioPlayer: _audioPlayer),
      ),
    );
  }
}

class Controls extends StatelessWidget{
  const Controls({
    super.key,
    required this.audioPlayer,
  });
  final AudioPlayer audioPlayer;

  @override 
  @override 
Widget build(BuildContext context) {
  return StreamBuilder<PlayerState>(
    stream: audioPlayer.playerStateStream,
    builder: (context, snapshot) {
      final playerState = snapshot.data;
      final processingState = playerState?.processingState;
      final playing = playerState?.playing;

      if (!(playing ?? false)) {
        return IconButton(
          onPressed: audioPlayer.play,
          iconSize: 80,
          color: Colors.pink,
          icon: const Icon(Icons.play_arrow_rounded),
        );
      } else if (processingState != ProcessingState.completed) {
        return IconButton(
          onPressed: audioPlayer.pause,
          iconSize: 80,
          color: Colors.amber,
          icon: const Icon(Icons.pause_rounded),
        );
      }
      return const Icon(
        Icons.play_arrow_rounded,
        size: 80,
        color: Colors.blueGrey,
      );
    },
  );
}

}
