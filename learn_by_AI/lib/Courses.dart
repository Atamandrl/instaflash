import 'package:flutter/material.dart';
import 'Categories.dart';
import 'CardPage.dart';

class Courses extends StatelessWidget {
  final Categories category;

  const Courses({super.key, required this.category});

  // Her kategori için ayrı subTopic listesi
  List<String> getSubTopics() {
    switch (category.categori_id) {
      case 1: // Math
        return [
          "Algebra",
          "Trigonometry",
          "Geometry",
          "Probability",
          "Functions",
        ];
      case 2: // Language
        return [
          "Grammar",
          "Vocabulary",
          "Reading",
          "Writing",
          "Speaking",
        ];
      case 3: // Biology
        return [
          "Cells",
          "Genetics",
          "Evolution",
          "Ecology",
          "Anatomy",
        ];
      case 4: // History
        return [
          "Ancient",
          "Medieval",
          "Modern",
          "Turkish History",
          "World Wars",
        ];
      default:
        return ["General"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final subTopics = getSubTopics();

    return Scaffold(
      appBar: AppBar(title: Text("${category.categori_name} Courses")),
      body: ListView.builder(
        itemCount: subTopics.length,
        itemBuilder: (context, index) {
          final topic = subTopics[index];
          return ListTile(
            title: Text(topic),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardPage(topic: topic),
              ),
            ),
          );
        },
      ),
    );
  }
}
