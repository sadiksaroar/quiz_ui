import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selectedAnswer = -1; // To track selected answer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heart indicators for lives
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index == 0 ? Icons.favorite_border : Icons.favorite,
                  color: Colors.red,
                );
              }),
            ),
            SizedBox(height: 10),

            // Quiz Illustration
            Image.asset(
              'assets/quiz_illustration.png', // Replace with actual image path
              width: 200,
            ),
            SizedBox(height: 20),

            // Listen & Question Toggle
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToggleButton("Listen", true),
                  _buildToggleButton("Question", false),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Question
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "What would you like to practice?",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            // Answer Options
            Column(
              children: List.generate(4, (index) {
                return _buildAnswerOption(index, ["A", "B", "C", "D"][index]);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey[300],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAnswerOption(int index, String optionText) {
    bool isSelected = index == 1; // Preselected answer (B)
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          optionText,
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
