import 'package:flutter/material.dart';
import '../services/api_service.dart';

class FlashcardTestScreen extends StatefulWidget {
  @override
  _FlashcardTestScreenState createState() => _FlashcardTestScreenState();
}

class _FlashcardTestScreenState extends State<FlashcardTestScreen> {
  final ApiService api = ApiService();
  List<Map<String, String>> cards = [];
  bool isLoading = false;

  void fetchCards() async {
    setState(() => isLoading = true);
    try {
      cards = await api.generateCards("General Knowledge");
    } catch (e) {
      print("Hata: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flashcard Test')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: fetchCards,
            child: Text("Kartları Al"),
          ),
          if (isLoading)
            CircularProgressIndicator()
          else
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(cards[index]['question'] ?? ''),
                      subtitle: Text(cards[index]['answer'] ?? ''),
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
