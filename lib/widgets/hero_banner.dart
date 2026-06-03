import 'package:flutter/material.dart';
import 'dart:async';

class HeroBanner extends StatefulWidget {
  const HeroBanner({Key? key}) : super(key: key);

  @override
  State<HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<HeroBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  // Lista de fondos para simular el carrusel con assets proporcionados por el usuario
  final List<String> _backgrounds = [
    'assets/images/pelis.png',
    'assets/images/futbol.png',
    'assets/images/futbol2.png',
  ];

  final List<String> _titles = ['Zootopia 2', 'Conmebol Libertadores', 'UEFA Champions League'];

  @override
  void initState() {
    super.initState();
    // Iniciar rotación automática
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (mounted) {
        setState(() {
          if (_currentPage < _backgrounds.length - 1) {
            _currentPage++;
          } else {
            _currentPage = 0;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550, // Altura del banner hero
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Carrusel de imágenes con animación de desvanecimiento suave (Cross Fade)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 1200), // Duración suave del fade
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: SizedBox.expand(
              key: ValueKey<int>(_currentPage),
              child: Image.asset(
                _backgrounds[_currentPage],
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[900]),
              ),
            ),
          ),
          
          // Gradiente inferior para oscurecer y transicionar al fondo
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xFF040714), // Color de fondo principal
                ],
                stops: [0.4, 1.0],
              ),
            ),
          ),
          
          // UI Superior: Título a la izquierda, Botón a la derecha
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1200),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Text(
                    _titles[_currentPage],
                    key: ValueKey<int>(_currentPage),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    border: Border.all(color: Colors.white24, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Indicador de Paginación Lateral (Simulado)
          Positioned(
            right: 15,
            top: 200,
            child: Column(
              children: List.generate(_backgrounds.length, (index) {
                return Container(
                  width: 3,
                  height: _currentPage == index ? 24 : 16,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.white38,
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              })
                ..add(
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.pause, color: Colors.white70, size: 16),
                  ),
                ),
            ),
          ),

          // Contenido principal superpuesto (Logo y Textos)
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Logo de Disney+
                Image.asset(
                  'assets/images/disney_logo.png',
                  height: 100,
                  color: Colors.white, // Tintar de blanco por si tiene color
                  errorBuilder: (context, error, stackTrace) => const Text(
                    'DISNEY+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Series exclusivas, éxitos del cine, el deporte de ESPN y más',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Ingresa tu correo para comenzar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
