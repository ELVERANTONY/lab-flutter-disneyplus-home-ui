import 'package:flutter/material.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          const Text(
            'Preguntas frecuentes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildFaqItem('¿Qué incluye Disney+?'),
          _buildFaqItem('¿Cómo puedo pagar?'),
          _buildFaqItem('¿Dónde puedo ver Disney+?'),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2029), // Fondo oscuro para el acordeón
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.add, color: Colors.white, size: 28),
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Detalles sobre esta pregunta frecuente. Contenido de prueba.',
              style: TextStyle(color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }
}
