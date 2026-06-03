import 'package:flutter/material.dart';

class PlansTable extends StatelessWidget {
  const PlansTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        children: [
          const Text(
            '¿Qué plan vas a elegir?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Podrás modificarlo o cancelarlo cuando quieras.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),
          // Simulador simple de tabla
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15), // Espacio superior para la etiqueta
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 24.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00E5FF),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0)),
                                ),
                                child: const Text(
                                  'PREMIUM',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: const Text('PEN 68,90/mes (final)*', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 24.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF1B4E5E),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8.0)),
                                ),
                                child: const Text(
                                  'ESTÁNDAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: const Text('PEN 49,90/mes (final)*', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.white24, height: 1),
                    _buildTableRow('Plan anual\nDisfruta de 12 meses al precio de 9', true, true),
                    _buildTableRow('Todos los canales de ESPN y deportes en vivo', true, false),
                    _buildTableRow('Calidad de video hasta 4K UHD y Dolby Atmos', true, false),
                    _buildTableRow('Dispositivos para ver en simultáneo', true, true, val1: '4', val2: '2'),
                    _buildTableRow('Descargas para ver sin conexión', true, true),
                  ],
                ),
              ),
              // Etiqueta Más popular flotando
              Positioned(
                top: 0,
                left: MediaQuery.of(context).size.width * 0.25 - 45, // Aproximadamente el centro de la columna izquierda
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Más popular', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(String title, bool check1, bool check2, {String? val1, String? val2}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white24)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: val1 != null 
                    ? Text(val1, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))
                    : Icon(check1 ? Icons.check : Icons.remove, color: Colors.white),
                ),
              ),
              Expanded(
                child: Center(
                  child: val2 != null 
                    ? Text(val2, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))
                    : Icon(check2 ? Icons.check : Icons.remove, color: Colors.white54),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
