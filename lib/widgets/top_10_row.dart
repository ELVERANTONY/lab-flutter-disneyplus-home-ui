import 'package:flutter/material.dart';

class Top10Row extends StatelessWidget {
  const Top10Row({Key? key}) : super(key: key);

  final List<Map<String, String>> top10Data = const [
    {
      'url': 'https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&q=80&w=500',
      'title': 'Una presentación especial de Marvel Television: The Punisher: La Última Muerte',
      'age': '18+', 'year': '2026', 'genre': 'Superhéroes, Acción y aventura'
    },
    {
      'url': 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?auto=format&fit=crop&q=80&w=500',
      'title': '¡Ayuda!',
      'age': '16+', 'year': '2026', 'genre': 'Comedia, Terror, Suspenso'
    },
    {
      'url': 'https://images.unsplash.com/photo-1635805737707-575885ab0820?auto=format&fit=crop&q=80&w=500',
      'title': 'Star Wars: The Mandalorian and Grogu',
      'age': '14+', 'year': '2026', 'genre': 'Acción y aventura, Ciencia ficción'
    },
    {
      'url': 'https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?auto=format&fit=crop&q=80&w=500',
      'title': 'Doctor al borde del amor',
      'age': '14+', 'year': '2026', 'genre': 'Drama, Medicina, Comedia'
    },
    {
      'url': 'https://images.unsplash.com/photo-1608889175123-8ec330b86f84?auto=format&fit=crop&q=80&w=500',
      'title': 'Toy Story 4',
      'age': '0+', 'year': '2019', 'genre': 'Animación, Comedia'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Top 10 Hoy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 320, // Altura ajustada para el póster + texto
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: top10Data.length,
              itemBuilder: (context, index) {
                final item = top10Data[index];
                return Container(
                  width: 140,
                  margin: EdgeInsets.only(
                    left: index == 0 ? 20.0 : 10.0,
                    right: index == top10Data.length - 1 ? 20.0 : 0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Póster + Número
                      Stack(
                        clipBehavior: Clip.none, // Evita cortar el número gigante
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              item['url']!,
                              width: 140,
                              height: 210,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 140,
                                height: 210,
                                color: Colors.grey[800],
                                child: const Icon(Icons.movie, color: Colors.white54),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -15,
                            left: 5,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF00E5FF),
                                height: 1.0,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 3.0,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Meta tags: Título centrado
                      Text(
                        item['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Meta tags: Edad, año, género centrado
                      Text(
                        '${item['age']} • ${item['year']} • ${item['genre']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70, fontSize: 10),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
