import 'package:flutter/material.dart';
import 'package:pdf_read/pages/main_page_read.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPageFiles(),
    );
  }
}
