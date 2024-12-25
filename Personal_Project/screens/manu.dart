import 'package:chesstwo/screens/game_board.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Weeboo Chess'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the logo
              Image.asset(
                'lib/images/knight.png', // Path to your logo image
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(height: 20),
              const Text(
                'WEEBOO Chess',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              SwipeableButtonView(
                buttonText: 'Slide to Play',
                buttontextstyle:
                    TextStyle(fontSize: 25, color: Colors.grey.shade800),
                buttonWidget: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.grey),
                activeColor: Colors.grey.shade300,
                onWaitingProcess: () {
                  // Amount of time the circular progress indicator spins before navigating to next page
                  Future.delayed(const Duration(seconds: 2),
                      () => setState(() => isFinished = true));
                },
                isFinished: isFinished,
                onFinish: () async {
                  // Navigate to the game board
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const GameBoard(),
                    ),
                  );
                  // Reset isFinished variable
                  setState(() {
                    isFinished = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
