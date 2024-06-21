import 'package:flutter/material.dart';
import 'package:wakeel_app/log_inScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;

  final List<String> images = [
    'slide_1.png',
    'slide_2.png',
    'slide_3.png',
  ];
  final CarouselController _carouselController = CarouselController();

  Future<bool?> _update() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('repeat', false);
  }

  void _nextSlide() {
    if (_currentIndex < images.length - 1) {
      _carouselController.nextPage();
      setState(() {
        _currentIndex++;
      });
    } else {
      _update();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              _update();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Color(0xFF193A33)), // Set text color
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: images.map((image) {
                return Image.asset(
                  'assests/$image',
                  fit: BoxFit.cover,
                );
              }).toList(),
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 400,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images.map((image) {
                    int index = images.indexOf(image);
                    return Container(
                      width: _currentIndex == index ? 18 : 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? const Color(0xFF193A33) // Set indicator color
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextSlide,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF193A33), // Set button color
              ),
              child: Text(
                _currentIndex < images.length - 1 ? 'Next' : 'Finish',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

