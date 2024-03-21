import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import 'package:just_audio/just_audio.dart';
import "package:just_audio_background/just_audio_background.dart";
import "package:xetv/Radio/gradient.dart";


class radio extends StatefulWidget {
  const radio({super.key});
  @override
  State<radio> createState() => _radioState();
}
class _radioState extends State<radio> {
  late AudioPlayer _audioPlayer;

  final _playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(Uri.parse('https://radio.golsystems.com.mx/8202/stream'),
        tag: MediaItem(id: '0',
         title: 'Radio en vivo XHVX',
         artist: '89.7 FM',
         artUri: Uri.parse('images/logo.png'),
         )
      )
    ],
  );

  @override
  void initState(){
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async{
    await _audioPlayer.setAudioSource(_playlist);
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
      child: Column(
        children: [
          Controls(audioPlayer: _audioPlayer),
          MediaMetadata(
            imageUrl: 'URL_DE_LA_IMAGEN',
            title: 'Título de la canción',
            artist: 'Nombre del artista',
          ),
        ],
      ),
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

class MediaMetadata extends StatelessWidget{
  const MediaMetadata({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });
  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context){
    return Column(children: [
      DecoratedBox(decoration: BoxDecoration( 
        boxShadow: const [
          BoxShadow(
            color:Colors.black12,
            offset: Offset(2 , 4 ),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect( 
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage( 
          imageUrl: imageUrl,
          height:300,
          width:300,
          fit:BoxFit.cover,
        ),
      ),
      ),
     
//4:30

      const SizedBox(height: 20),
      Text( 
        artist,
        style: const TextStyle( 
          color: Colors.amberAccent,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 8),
      Text(
        artist,
        style: const TextStyle( 
          color: Colors.red,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}


