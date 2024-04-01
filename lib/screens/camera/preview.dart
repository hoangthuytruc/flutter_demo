import 'dart:io';
import 'package:flutter/material.dart';

// A widget that displays the picture taken by the user.
class PreviewScreen extends StatefulWidget {
  final String imagePath;

  const PreviewScreen({super.key, required this.imagePath});
  
  @override
  PreviewState createState() => PreviewState();
}

class PreviewState extends State<PreviewScreen> {
  late Image image;

  Future<void> translate(Image image) async {
    print('translating...');
    // Get data from api
  }

  @override
  void initState() {
    super.initState();
    image = Image.file(File(widget.imagePath));
    translate(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: image,
    );
  }
}