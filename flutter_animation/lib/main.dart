import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Positioned Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedPositionedScreen(),
    );
  }
}

class AnimatedPositionedScreen extends StatefulWidget {
  const AnimatedPositionedScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPositionedScreenState createState() =>
      _AnimatedPositionedScreenState();
}

class _AnimatedPositionedScreenState extends State<AnimatedPositionedScreen> {
  bool _isMoved = false;

  void _togglePosition() {
    setState(() {
      _isMoved = !_isMoved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned Demo'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              left: _isMoved ? 200.0 : 50.0,
              top: _isMoved ? 400.0 : 50.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Example',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePosition,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
