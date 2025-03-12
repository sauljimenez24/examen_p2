import 'package:flutter/material.dart';

class Refacciones {
  final String nombrePieza;
  final int cantidad;
  final double precioProducto;

  Refacciones({
    required this.nombrePieza,
    required this.cantidad,
    required this.precioProducto,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RefaccionesList(),
    );
  }
}

class RefaccionesList extends StatelessWidget {
  RefaccionesList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> refaccionesData = [
    {'nombre_pieza': 'Freno', 'cantidad': 2, 'precio_producto': 150.0},
    {'nombre_pieza': 'Bujía', 'cantidad': 4, 'precio_producto': 50.0},
    {'nombre_pieza': 'Aceite', 'cantidad': 1, 'precio_producto': 30.0},
    {'nombre_pieza': 'Filtro', 'cantidad': 3, 'precio_producto': 20.0},
    {'nombre_pieza': 'Batería', 'cantidad': 1, 'precio_producto': 200.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            '    Refaccionaria SAJR \n Saul Jimenez - 22308051281222'),
        backgroundColor: Color(0xffc77e26), // Color elegante y llamativo
        elevation: 20, // Sombra debajo del AppBar
        titleTextStyle: TextStyle(
          fontSize: 22, // Tamaño de la fuente del título
          fontWeight: FontWeight.bold, // Estilo de la fuente
          color: Color(0xff090808), // Color oscuro para el texto
        ),
        titleSpacing: 0.0, // Establecer el espaciado para centrar el texto
        centerTitle: true, // Asegura que el título esté centrado
      ),
      body: Center(
        child: ListView(
          children: refaccionesData.map((map) {
            final refaccion = Refacciones(
              nombrePieza: map['nombre_pieza'],
              cantidad: map['cantidad'],
              precioProducto: map['precio_producto'],
            );
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  gradient: _getGradientForRefaccion(refaccion),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          refaccion.nombrePieza,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff030101),
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Cantidad: ${refaccion.cantidad}',
                          style: TextStyle(
                            fontSize: 24, // Aumenté el tamaño de la fuente
                            color: Colors.black, // Color negro
                            fontWeight: FontWeight.bold, // Estilo en negrita
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Precio: \$${refaccion.precioProducto.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 24, // Aumenté el tamaño de la fuente
                            color: Color(0xff000000), // Color negro
                            fontWeight: FontWeight.bold, // Estilo en negrita
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Función para asignar un gradiente diferente a cada refacción con colores claros
  LinearGradient _getGradientForRefaccion(Refacciones refaccion) {
    switch (refaccion.nombrePieza) {
      case 'Freno':
        return LinearGradient(
          colors: [Colors.blueAccent, Colors.cyan],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'Bujía':
        return LinearGradient(
          colors: [Colors.yellowAccent, Colors.orangeAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'Aceite':
        return LinearGradient(
          colors: [Colors.greenAccent, Colors.lightGreenAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'Filtro':
        return LinearGradient(
          colors: [Colors.purpleAccent, Colors.pinkAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      case 'Batería':
        return LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.blueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
      default:
        return LinearGradient(
          colors: [Colors.white, Colors.grey],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
    }
  }
}
