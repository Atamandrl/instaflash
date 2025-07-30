import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'http://10.0.2.2:8000'; // Emülatör için 10.0.2.2 olabilir

  Future<List<Map<String, String>>> generateCards(String topic) async {
    final url = Uri.parse('$_baseUrl/generate-cards');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'topic': topic}),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      List<dynamic> rawCards = decoded['cards'];

      return rawCards.map<Map<String, String>>((card) {
        return {
          'question': card['question'],
          'answer': card['answer'],
        };
      }).toList();
    } else {
      throw Exception('API hatası: ${response.statusCode}');
    }
  }
}
