import 'package:flutter/material.dart';
import 'package:local_image_provider/device_image.dart';
import 'src/repository/repository_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria Livre',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Suas Fotos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  RepositoryImages repositorio = RepositoryImages();
  late DeviceImage _image;
  List<DeviceImage> _images = [];
  late Image apresentar;

  void _incrementCounter() {
    carregarImagens();
  }

  void carregarImagens() async
  {
    List<DeviceImage> result = await repositorio.loadDeviceImages();

    setState(() {
      _images =  result;
      _counter++; 
    });
  }

  @override
  Widget build(BuildContext context) {
    
    _images.length;
    if (_images.length > 0)
    { 
      _image = _images[_counter];
      apresentar = Image(image: _image);
    }
    else 
    {
      apresentar = Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg');
    }

    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: apresentar,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Iniciar',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
