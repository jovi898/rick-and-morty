import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
key: ValueKey('MyButtonContainer'),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.red),
      child: Text('Button'),
    );
  }
}