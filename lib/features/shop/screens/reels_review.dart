import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image or Video
          Container(
            // Add your background image or video here
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sunscreen.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Reel Content
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                // Handle tap event
              },
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10, // Number of reels
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Reel Image or Video
                        Container(
                          width: double.infinity,
                          height: 300, // Adjust height as needed
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/cetaphil_cream.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        // User Avatar and Name
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20.0,
                              backgroundImage:
                                  AssetImage('assets/sunscreen.jpg'),
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Username $index',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        // Reel Caption
                        const Text(
                          'This is a reel caption. Description of the reel content goes here.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
