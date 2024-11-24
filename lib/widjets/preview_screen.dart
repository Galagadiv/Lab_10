import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final String text;
  final double fontSize;

  PreviewScreen({String? text, required this.fontSize})
      : this.text = (text == null || text.isEmpty) ? "Don't know what to say" : text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(120, 66, 245, 0.4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Повернення результату за замовчуванням
            Navigator.pop(context, "Don't know what to say");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Повертаємо текст 'Cool!' при натисканні
                    Navigator.pop(context, 'Cool!');
                  },
                  child: const Text('Ok'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Повертаємо текст 'Let’s try something else' при натисканні
                    Navigator.pop(context, 'Let’s try something else');
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
