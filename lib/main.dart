import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Programas de TV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<SerieTV> seriesTV = [
    SerieTV(nombre: 'Juego de Tronos', descripcion: 'Serie de drama fantástico'),
    SerieTV(nombre: 'Stranger Things', descripcion: 'Serie de ciencia ficción y terror'),
    SerieTV(nombre: 'Breaking Bad', descripcion: 'Serie de drama criminal'),
    SerieTV(nombre: 'The Crown', descripcion: 'Serie de drama histórico'),
    SerieTV(nombre: 'Friends', descripcion: 'Serie de comedia'),
    SerieTV(nombre: 'Los Simpson', descripcion: 'Serie de comedia animada'),
    SerieTV(nombre: 'The Office', descripcion: 'Serie de comedia estilo mockumentary'),
    SerieTV(nombre: 'Black Mirror', descripcion: 'Serie de ciencia ficción antológica'),
    SerieTV(nombre: 'The Mandalorian', descripcion: 'Serie de space western'),
    SerieTV(nombre: 'Sherlock', descripcion: 'Serie de drama criminal'),
    // Agrega más series aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Programas de TV'),
        backgroundColor: Colors.deepPurple, // Cambia el color de fondo de la barra de navegación
      ),
      body: ListView.builder(
        itemCount: seriesTV.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesSerieTV(serieTV: seriesTV[index]),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(10),
              color: Colors.grey[200], // Cambia el color de fondo de las tarjetas
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  seriesTV[index].nombre,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SerieTV {
  final String nombre;
  final String descripcion;

  SerieTV({required this.nombre, required this.descripcion});
}

class DetallesSerieTV extends StatelessWidget {
  final SerieTV serieTV;

  DetallesSerieTV({required this.serieTV});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serieTV.nombre),
        backgroundColor: Colors.deepPurple, // Cambia el color de fondo de la barra de navegación
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serieTV.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              serieTV.descripcion,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
