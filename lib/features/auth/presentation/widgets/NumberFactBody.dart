import 'package:flutter/material.dart';

class NumberFactBody extends StatelessWidget {
  final String fact;
  final int number;

  const NumberFactBody({
    super.key,
    required this.fact,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Refresh header
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Random Fact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Funny picture placeholder
        Container(
          height: 150,
          width: 150,
          
          child: Image.asset(
            "assets/art/samy.png",
            width: 64,
            height: 64,
          ),
        ),

        const SizedBox(height: 16),

        // Number & Fact
        Text(
          '$number',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            fact,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
