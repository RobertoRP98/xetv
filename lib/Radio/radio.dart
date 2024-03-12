import "package:flutter/material.dart";

class radio extends StatefulWidget {
  const radio({super.key});

  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Radio en vivo'),
      ),
      body: const Center( 
        child: Text('Hola mundo desde radio'),
      ),
    );
  }
}