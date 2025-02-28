import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key, required this.onThemeTap});

  final VoidCallback onThemeTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onThemeTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.deepPurple.withAlpha(70),
        ),
        child: Text('Theme', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
