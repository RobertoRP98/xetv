import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

class news extends StatefulWidget {
  const news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {

  final controller=WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse('https://www.grupovx.com/'));
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Noticias del dia'),
      ),
      body: WebViewWidget(controller: controller)
      );
  }
}