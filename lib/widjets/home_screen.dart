import 'package:flutter/material.dart';
import 'preview_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 16;

  Future<void> _showDialog(String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Message'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Previewer'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(120, 66, 245, 0.4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('Font size: ${_fontSize.toStringAsFixed(0)}'),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 10,
                    max: 100,
                    divisions: 18,
                    label: _fontSize.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final String textToSend = _textController.text.isEmpty
                      ? "Don't know what to say"
                      : _textController.text;

                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewScreen(
                        text: textToSend,
                        fontSize: _fontSize,
                      ),
                    ),
                  );
                },
                child: Text('Preview'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
