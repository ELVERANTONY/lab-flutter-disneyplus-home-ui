import 'dart:convert';

class MockApiService {
  // Simula una respuesta HTTP tipo JSON
  Future<List<dynamic>> fetchMovies() async {
    // Simulando latencia de red
    await Future.delayed(const Duration(seconds: 1));
    
    // JSON simulado
    const jsonString = '''
    [
      {
        "id": "1",
        "title": "La Corona Perfecta",
        "imageUrl": "https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&q=80&w=500"
      },
      {
        "id": "2",
        "title": "Los Testamentos",
        "imageUrl": "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?auto=format&fit=crop&q=80&w=500"
      },
      {
        "id": "3",
        "title": "The Mandalorian",
        "imageUrl": "https://images.unsplash.com/photo-1635805737707-575885ab0820?auto=format&fit=crop&q=80&w=500"
      },
      {
        "id": "4",
        "title": "Loki",
        "imageUrl": "https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?auto=format&fit=crop&q=80&w=500"
      },
      {
        "id": "5",
        "title": "Avengers",
        "imageUrl": "https://images.unsplash.com/photo-1608889175123-8ec330b86f84?auto=format&fit=crop&q=80&w=500"
      }
    ]
    ''';
    
    return json.decode(jsonString);
  }
}
