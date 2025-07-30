import 'dart:convert';
import 'package:http/http.dart' as http;

class FlashcardService {
  static Future<List<Map<String, String>>> getFlashcards(String category) async {
    final uri = Uri.parse("http://10.0.2.2:8000/flashcards/$category");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map<Map<String, String>>((item) {
        return {
          'question': item['question'],
          'answer': item['answer'],
        };
      }).toList();
    } else {
      throw Exception("Flashcards could not be loaded");
    }
  }
}
