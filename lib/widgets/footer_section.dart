import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      width: double.infinity,
      color: const Color(0xFF0F1014), // Fondo más oscuro para footer
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Enlaces superiores del footer
          _buildActionRow('Más información'),
          _buildActionRow('Términos de uso'),
          _buildActionRow('Política de privacidad'),
          _buildActionRow('Publicidad personalizada'),
          _buildActionRow('Acuerdo de Suscripción'),
          _buildActionRow('Complemento de Política de Privacidad'),
          _buildActionRow('Ayuda'),
          _buildActionRow('Marcas'),
          _buildActionRow('Colecciones'),
          
          const SizedBox(height: 20),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 30),
          
          // Iconos de Redes Sociales (usaremos placeholders si no tenemos los assets SVG)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.close, color: Colors.white54, size: 28), // X (Twitter)
              Icon(Icons.facebook, color: Colors.white54, size: 28), // Facebook
              Icon(Icons.camera_alt, color: Colors.white54, size: 28), // Instagram
              Icon(Icons.music_note, color: Colors.white54, size: 28), // TikTok
              Icon(Icons.play_circle_filled, color: Colors.white54, size: 28), // YouTube
            ],
          ),
          
          const SizedBox(height: 40),
          
          // Logo
          Image.asset(
            'assets/images/disney_logo.png',
            height: 60,
            errorBuilder: (context, error, stackTrace) => const Text(
              'DISNEY+',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          
          const SizedBox(height: 30),
          
          // Textos legales
          const Text(
            '© 2026 Disney y su familia de compañías afiliadas. Todos los derechos reservados.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 11, height: 1.5),
          ),
          const SizedBox(height: 8),
          const Text(
            'Disney+ requiere una suscripción y ser mayor de 18 años. Contenidos sujetos a disponibilidad.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 11, height: 1.5),
          ),
          const SizedBox(height: 8),
          const Text(
            'El servicio Disney+ es comercializado por Disney DTC LATAM, Inc., 2400 W Alameda Ave.,\nBurbank CA 91521 y Tax ID 75-3016153.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 11, height: 1.5),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildActionRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }
}
