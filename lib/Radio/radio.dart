import "package:flutter/material.dart";
import 'package:just_audio/just_audio.dart';
import "package:cached_network_image/cached_network_image.dart";
import "package:just_audio_background/just_audio_background.dart";
import "package:xetv/Radio/gradient.dart";

class radio extends StatefulWidget {
  const radio({Key? key}) : super(key: key);

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  late AudioPlayer _audioPlayer;

  final _playlist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse('https://radio.golsystems.com.mx/8202/stream'),
        tag: MediaItem(
          id: '0',
          title: 'Radio en vivo XHVX',
          artist: '89.7 FM',
          artUri: Uri.parse('https://www.grupovx.com/src/logo-vx.png'),
          
        ),
      )
    ],
  );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setAudioSource(_playlist);
  }

  @override
  void dispose() {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<SequenceState?>(
              stream: _audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? true) {
                  return const SizedBox();
                }
                final metadata =
                    state!.currentSource!.tag as MediaItem;
                return MediaMetadata(
                  imageUrl: metadata.artUri.toString(),
                  artist: '',
                  title: '',
                );
              },
            ),
            Controls(audioPlayer: _audioPlayer),

          ],
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);
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
            iconSize: 120,
            color: Colors.black54,
            icon: const Icon(Icons.play_arrow_rounded),

          );
        } else if (processingState != ProcessingState.completed) {
          return IconButton(
            onPressed: audioPlayer.pause,
            iconSize: 120,
            color: Colors.black54,
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

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  }) : super(key: key);
  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                offset: Offset(2, 4),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 300,
              width: 300,
              fit: BoxFit.none
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            color: Colors.yellowAccent,
            fontSize: 0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          artist,
          style: const TextStyle(
            color: Colors.redAccent,
            fontSize: 0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

