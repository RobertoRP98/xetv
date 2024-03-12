import "package:flutter/material.dart";

class streaming extends StatefulWidget {
  const streaming({super.key});

  @override
  State<streaming> createState() => _streamingState();
}

class _streamingState extends State<streaming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Transmisión en vivo'),
      ),
      body: const Center( 
        child: Text('Hola mundo desde streaming'),
      ),
    );
  }
}