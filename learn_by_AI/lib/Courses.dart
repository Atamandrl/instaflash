import 'package:flutter/material.dart';
import 'CardPage.dart';
import 'Categories.dart';
import 'CourseDetail.dart';
import 'SubHeading.dart';

class Courses extends StatelessWidget {
  final Categories category;

  const Courses({super.key, required this.category});

  Future<List<CourseDetail>> fetchCourses() async {
    var sh1 = SubHeading(1, "General");

    return [
      CourseDetail(1, "Study With Questions", 1, "Book.png", category, sh1),
      CourseDetail(2, "Ask AI", 1, "AI.png", category, sh1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lessons: ${category.categori_name}"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<CourseDetail>>(
        future: fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var courseList = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2.8,
              ),
              itemCount: courseList.length,
              itemBuilder: (context, index) {
                var course = courseList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const CardPage()));
                  },
                  child: Card(
                    elevation: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("images/${course.deger_img}", height: 80),
                        const SizedBox(height: 8),
                        Text(course.coursename,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(course.category.categori_name),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

