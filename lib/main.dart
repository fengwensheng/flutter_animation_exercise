import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(_) => MaterialApp(home: Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final Duration duration = const Duration(milliseconds: 1000);

  void _startAnimation() {
    _ctrl.forward(from: 0);
  }

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: duration);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(_) => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: _startAnimation,
            child: AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) => Text(
                'FLUTTER',
                style: TextStyle(
                  fontSize: 50,
                  foreground: _getPaint(),
                ),
              ),
            ),
          ),
        ),
      );

  Paint _getPaint() {
    return Paint()
      // ..color = Colors.black
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, _ctrl.value * 15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = ui.Gradient.linear(
        Offset(0, 0),
        Offset(100, 0),
        [
          Colors.green,
          Colors.orange,
          Colors.purple,
        ],
        [
          1.0 / 7,
          5.0 / 7,
          1.0 / 7,
        ],
        TileMode.mirror,
        Matrix4.rotationZ(pi / 6).storage,
      );
  }
}
