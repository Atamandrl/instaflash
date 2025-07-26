import 'package:flutter/material.dart';
import 'Categories.dart';
import 'Courses.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ProfilePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;

  final List<Categories> categories = const [
    Categories(1, "Math"),
    Categories(2, "Language"),
    Categories(3, "Biology"),
    Categories(5, "History"),
  ];

  final Map<int, double> progressMap = {
    1: 0.45,
    2: 0.25,
    3: 0.60,
    5: 0.30,
  };

  final MaterialColor continueButtonColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: const AssetImage("images/Athena.png"),
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '328',
                    style: GoogleFonts.libreBaskerville(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: const AssetImage("images/profile.png"),
                  radius: 20,
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(minHeight: 300),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("images/bg.png"),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "38% Success rate",
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 16,
                              color: const Color(0xFF595858),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const LinearProgressIndicator(
                            value: 0.38,
                            backgroundColor: Colors.white54,
                            color: Colors.black54,
                            minHeight: 6,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Your Level",
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 18,
                              color: const Color(0xFF4A4A4A),
                            ),
                          ),
                          Text(
                            "Intermediate",
                            style: GoogleFonts.libreBaskerville(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF4A4A4A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Center(
                          child: Image.asset("images/cha.png", fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                "Courses",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final progress = progressMap[category.categori_id] ?? 0.0;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Courses(category: category),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.purple[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(
                                  "images/${category.categori_name.toLowerCase()}.png",
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      category.categori_name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.grey[300],
                                      color: const Color(0xFFCC7B74),
                                      minHeight: 6,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: continueButtonColor[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "Continue Learning",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              const Text(
                "Your Achievements",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 36),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDF9F3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _achievement(
                        imagePath: "images/badge.png",
                        title: "Grammar\nLord",
                        iconColor: Colors.amber,
                      ),
                      const SizedBox(width: 24),
                      _achievement(
                        imagePath: "images/cup.png",
                        title: "Legend\nLearner",
                        iconColor: Colors.amber,
                      ),
                      const SizedBox(width: 24),
                      _achievement(
                        imagePath: "images/bookworm.png",
                        title: "Bookworm\n",
                        iconColor: Colors.deepPurple,
                      ),
                      const SizedBox(width: 24),
                      _achievement(
                        icon: Icons.star,
                        title: "3 Chapters\nCompleted",
                        iconColor: Colors.deepPurple,
                      ),
                      const SizedBox(width: 24),
                      _achievement(
                        icon: Icons.emoji_events,
                        title: "Level 2\nIntermediate",
                        iconColor: Colors.yellow[800],
                      ),
                      const SizedBox(width: 24),
                      _achievement(
                        icon: Icons.access_time,
                        title: "45 min\nLearning time",
                        iconColor: Colors.indigo,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _achievement({
    IconData? icon,
    String? imagePath,
    required String title,
    Color? iconColor,
  }) {
    late Widget avatarChild;

    if (imagePath != null) {
      avatarChild = ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          imagePath,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
      );
    } else if (icon != null) {
      avatarChild = Icon(icon, color: iconColor ?? Colors.black, size: 24);
    } else {
      avatarChild = const SizedBox.shrink();
    }

    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: iconColor?.withOpacity(0.2) ?? Colors.grey[200],
          child: avatarChild,
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
