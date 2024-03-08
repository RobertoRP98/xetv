import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  List<String> image = [
  'https://static.vecteezy.com/system/resources/previews/014/802/054/large_2x/live-streaming-icon-live-buttons-transparent-broadcasting-signs-concept-free-png.png',
  'https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg',
  'https://cdn.pixabay.com/photo/2014/09/08/17/32/humming-bird-439364_960_720.jpg',
];

List<String> title = ['Televisión en vivo', 'Radio', 'Noticias en linea',];

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Row( 
         mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Icon(Icons.live_tv),
            SizedBox(width: 10),
            Text('Seleccione un servicio'),
          ],
        ),
      ),
      // body: ListView(
      //   children: [
      //      widget.service(),
      //   ],
      // ),
    body: ListView.builder(
  itemCount: image.length, // Establece el número total de elementos en la lista
  itemBuilder: (BuildContext context, int index) {
    if (index >= 0 && index < image.length && index < title.length) {
      // Verifica que el índice esté dentro del rango válido
      return card2(image[index], title[index], context);
    } else {
      // Si el índice está fuera del rango válido, puedes devolver un widget vacío
      return SizedBox(); // O cualquier otro widget que desees mostrar en caso de error
    }
  },
),

    );
  }
}


 Widget _buildCard({required String imageSrc, required String title}) {
    return Card(
      color: Colors.black,
      child: Column(
        children: [
          Image.network(
            imageSrc,
            height: 200, // Establece la altura de la imagen
            width: double.infinity, // Establece el ancho de la imagen al ancho de la tarjeta
            fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el espacio disponible
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }


Widget card(String image, String title, BuildContext context){
  
  return Card(
    color: Colors.cyanAccent,
    elevation: 8.0,
    margin: EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column( 
      children: [ 
        Padding(padding: EdgeInsets.all(16.0),
        child: Image.network(
          image,
          height: MediaQuery.of(context).size.width*(3/4),
          width: MediaQuery.of(context).size.width,
        ),
      ),
      Text( 
        title,
        style: const TextStyle( 
          fontSize: 38.0,
          fontWeight: FontWeight.w700,
        ),
      )
      ],
    ),
  );
}



Widget card2(String thumbnailUrl, String title, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
    width: MediaQuery.of(context).size.width,
    height: 180,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(0.0, 10.0),
          blurRadius: 10.0,
          spreadRadius: -6.0,
        ),
      ],
      image: DecorationImage(
        colorFilter: ColorFilter.mode(
          Colors.white.withOpacity(0.35),
          BlendMode.multiply,
        ),
        image: NetworkImage(thumbnailUrl),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Filtro que tiene arriba que es el cuadro del texto
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    ),
  );
}
