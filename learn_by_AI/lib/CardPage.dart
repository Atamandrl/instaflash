import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardPage extends StatefulWidget {
  final String topic;
  const CardPage({super.key, required this.topic});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<dynamic> cards = [];
  bool isLoading = false;

  Future<void> fetchFlashcards() async {
    setState(() => isLoading = true);
    final url = Uri.parse('http://10.0.2.2:8000/generate-cards');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"topic": widget.topic}),
      );
      if (response.statusCode == 200) {
        print("API yanıtı: ${response.body}");
        setState(() => cards = json.decode(response.body)['cards']);
      }
    } catch (e) {
      print("Error: $e");
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchFlashcards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic: ${widget.topic}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
              (route) => false,
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : cards.isEmpty
              ? const Center(child: Text("No flashcards found."))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final card = cards[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(card['question'] ?? "No Question"),
                        subtitle: Text(card['answer'] ?? "No Answer"),
                      ),
                    );
                  },
                ),
    );
  }
}
