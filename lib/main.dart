import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World App'),
        ),
        body: Center(
          child: HelloWorldWithAnimatedFontSize(),
        ),
      ),
    );
  }
}

class HelloWorldWithAnimatedFontSize extends StatefulWidget {
  @override
  _HelloWorldWithAnimatedFontSizeState createState() =>
      _HelloWorldWithAnimatedFontSizeState();
}

class _HelloWorldWithAnimatedFontSizeState
    extends State<HelloWorldWithAnimatedFontSize>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;
  double _fontSize = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fontSizeAnimation = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFontSize() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _fontSizeAnimation,
          builder: (context, child) {
            return Text(
              'Hello, World!',
              style: TextStyle(
                fontSize: _fontSizeAnimation.value,
                fontWeight: FontWeight.normal,
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: _toggleFontSize,
          child: Text('Toggle Font Size Animation'),
        ),
      ],
    );
  }
}
