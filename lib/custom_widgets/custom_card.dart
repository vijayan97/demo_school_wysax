import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String cardText;
  final VoidCallback onTap;

  const CustomCard(this.cardText, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress : onTap,
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          height:MediaQuery.of(context).size.height * 0.05,
          child: Center(
            child: Text(
              cardText,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}