import 'package:flutter/material.dart';
import 'sosialpage.dart';
import 'package:alone/home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(90, 0, 100, 0),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/inggris.png', width: 35),

                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.red[400],
                        size: 35,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: const [
                      Icon(Icons.diamond, color: Colors.blue, size: 35),
                      SizedBox(width: 4),
                      Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: const [
                      Icon(Icons.favorite, color: Colors.red, size: 35),
                      SizedBox(width: 4),
                      Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xff58A700),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Level 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Beginner',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),

                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.menu_book, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * 0.03,
                      left: size.width * 0.38,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber,
                        child: const Icon(
                          Icons.check,
                          color: Color.fromARGB(255, 255, 249, 195),
                        ),
                      ),
                    ),

                    Positioned(
                      top: size.height * 0.16,
                      left: size.width * 0.22,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber,
                        child: const Icon(
                          Icons.check,
                          color: Color.fromARGB(255, 255, 249, 195),
                        ),
                      ),
                    ),

                    Positioned(
                      top: size.height * 0.28,
                      left: size.width * 0.24,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: Offset(0, 3),
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Text(
                                'START',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          const SizedBox(height: 8),

                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrangeAccent,
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.amber,
                              child: Icon(Icons.star, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      top: size.height * 0.33,
                      right: size.width * 0.37,
                      child: Image.asset(
                        "assets/owl.png",
                        width: size.width * 0.22,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Positioned(
                      top: size.height * 0.53,
                      left: size.width * 0.26,
                      child: const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.menu_book, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        currentIndex: 0,

        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SosialPage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
          if (index == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.headphones), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Siswa"),
        ],
      ),
    );
  }
}
