import "package:flutter/material.dart";
class gradient extends StatefulWidget {
  final Widget ? child;
  const gradient({Key? key, this.child}) : super(key: key);
  @override
  State<gradient> createState() => _gradientState();
}
class _gradientState extends State<gradient> {
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration( 
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight, 
        ),
      ),
      child: widget.child,
    );
  }
}