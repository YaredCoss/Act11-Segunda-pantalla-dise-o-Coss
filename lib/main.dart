import 'package:flutter/material.dart';

void main() => runApp(const MiAppProgreso());

class MiAppProgreso extends StatelessWidget {
  const MiAppProgreso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200], // Fondo gris claro
        appBar: AppBar(
          backgroundColor: Colors.grey[800], // Fondo oscuro como el de la imagen
          leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
          title: const Text("🚀 Tu Progreso", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: SingleChildScrollView( // Permite hacer scroll si el contenido es mucho
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSeccionEstadisticas(),
              const SizedBox(height: 20),
              _buildSeccionActividad(),
              const SizedBox(height: 20),
              _buildSeccionLogros(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2, // Selecciona "Logros"
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.sentiment_satisfied, color: Colors.green), label: 'Fácil'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Logros'),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS PERSONALIZADOS PARA CADA SECCIÓN ---

  Widget _buildSeccionEstadisticas() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Estadísticas Globales", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCirculoProgreso("75%", Colors.green),
              _buildCirculoProgreso("25%", Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCirculoProgreso(String porcentaje, Color color) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            value: double.parse(porcentaje.replaceAll('%', '')) / 100,
            strokeWidth: 10,
            color: color,
            backgroundColor: color.withValues(alpha: 0.2),
          ),
        ),
        Text(porcentaje, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSeccionActividad() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Tu Actividad", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("Tiempo total de estudio: 12h 45m", style: TextStyle(color: Colors.grey)),
          Text("Tarjetas creadas: 87", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSeccionLogros() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Tus Logros", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTarjetaLogro("Racha de 7 días", Icons.local_fire_department, Colors.orange),
           _buildTarjetaLogro("Experto Inglés", Icons.flag, Colors.amber), // Nota: Usa iconos de bandera si tienes paquetes extra
            _buildTarjetaLogro("Cerebro Lector", Icons.psychology, Colors.blue),
          ],
        ),
      ],
    );
  }

  Widget _buildTarjetaLogro(String titulo, IconData icono, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icono, size: 40, color: color),
          const SizedBox(height: 10),
          Text(titulo, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
