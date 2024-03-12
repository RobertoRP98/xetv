import "package:flutter/material.dart";

class notfound extends StatefulWidget {
  const notfound({super.key});

  @override
  State<notfound> createState() => _notfoundState();
}

class _notfoundState extends State<notfound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Pagina no encontrada'),
      ),
      body: const Center( 
        child: Text('Pagina no encontrada, regrese al menu principal'),
      ),
    );
  }
}