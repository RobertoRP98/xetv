import 'package:flutter/material.dart';
import 'package:xetv/Error/notFound.dart';
import 'package:xetv/News/news.dart';
import 'package:xetv/Radio/radio.dart';
import 'package:xetv/Streaming/streaming.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XEVA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Seleccione un servicio'),
        '/streaming' :(context) => const streaming(), 
        '/radio':(context) => const radio(), 
        '/news':(context) => const news(),    
      } ,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const notfound(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
  List<String> image = [
  'https://cdn.pixabay.com/photo/2021/06/26/18/11/live-6366830_960_720.png',
  'https://w7.pngwing.com/pngs/411/470/png-transparent-red-headphones-mike-music-radio-logo-music-radio-music-radio-station.png',
  'https://w7.pngwing.com/pngs/982/544/png-transparent-news-graphy-logo-icon-news-logo-text-photography-computer-wallpaper.png',
];
  List<String> title = ['Televisión en vivo', 'Radio', 'Noticias en linea',];
  List<String> links = ['/streaming', '/radio', '/news' ];

    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
   
    body: ListView.builder(
  itemCount: image.length, // Establece el número total de elementos en la lista
  itemBuilder: (BuildContext context, int index) {
    if (index >= 0 && index < image.length && index < title.length) {
      // Verifica que el índice esté dentro del rango válido
      return GestureDetector( 
        onTap: (){ 
          Navigator.pushNamed(context, links[index]);
        },
      child: card2(image[index], title[index], context)
      );
    } else {
      // Si el índice está fuera del rango válido, puedes devolver un widget vacío
      return SizedBox(); // O cualquier otro widget que desees mostrar en caso de error
    }
  },
),
    );
  }
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
