import 'package:flutter/material.dart';


class ResultScreen extends StatelessWidget {
  final String name;
  final String subject;
  final String category;
  final String marks;

  ResultScreen({
    required this.name,
    required this.subject,
    required this.category,
    required this.marks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Subject: $subject'),
            Text('Category: $category'),
            Text('Marks: $marks'),
          ],
        ),
      ),
    );
  }
}