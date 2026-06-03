import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/content_provider.dart';
import '../widgets/hero_banner.dart';
import '../widgets/email_form.dart';
import '../widgets/brands_row.dart';
import '../widgets/content_row.dart';
import '../widgets/top_10_row.dart';
import '../widgets/plans_table.dart';
import '../widgets/faq_section.dart';
import '../widgets/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040714), // Fondo clásico de Disney+
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sección Hero Principal (Stack con imagen, gradiente y logo)
            const HeroBanner(),
            
            const SizedBox(height: 10),
            
            // Formulario de suscripción (TextFormField + Button)
            const EmailSubscriptionForm(),
            
            // Fila de Marcas (Row/Wrap)
            const BrandsRow(),
            
            // Banner promocional (Deportes/Mundial)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?auto=format&fit=crop&q=80&w=1280', // Banner de deportes
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 150,
                    color: Colors.grey[800],
                    child: const Center(child: Text('Toda la cobertura deportiva', style: TextStyle(color: Colors.white))),
                  ),
                ),
              ),
            ),
            
            // Uso del Provider para mostrar contenido dinámico simulando HTTP
            Consumer<ContentProvider>(
              builder: (context, contentProvider, child) {
                if (contentProvider.isLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                }

                return Column(
                  children: [
                    ContentRow(
                      title: 'Novedades en Disney+',
                      movies: contentProvider.movies,
                    ),
                    ContentRow(
                      title: 'Tendencias',
                      movies: contentProvider.movies.reversed.toList(),
                    ),
                  ],
                );
              },
            ),
            
            // Nuevas secciones basadas en las capturas proporcionadas
            const Top10Row(),
            
            const PlansTable(),
            
            // Sección "Cuando y donde quieras"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                children: [
                  const Text(
                    'Cuando y donde quieras',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Disfruta tus favoritos en cualquier momento y lugar.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Mockup de dispositivos proporcionado por el usuario
                  Image.asset(
                    'assets/images/favoritos.png',
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.devices, size: 100, color: Colors.white54),
                  ),
                ],
              ),
            ),
            
            const FaqSection(),
            
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
