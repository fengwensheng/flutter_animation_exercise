import 'dart:async';

import 'package:flutter/material.dart';

class TextTyper extends StatefulWidget {
  @override
  _TextTyperState createState() => _TextTyperState();
}

class _TextTyperState extends State<TextTyper> {
  ///data field
  final String _text = '君子之交，其淡如水。\n'
      '执象而求，咫尺千里。\n'
      '问余何适，廓而忘言。\n'
      '华枝春满，天心月圆。\n';
  int _currentIndex = 0;
  Timer? _timer;
  String get currentText => _text.substring(0, _currentIndex);
  final Duration _animDuration = const Duration(milliseconds: 200);
  final ValueNotifier<String> _data = ValueNotifier<String>('');

  ///method
  void _startAnim() {
    _timer?.cancel();
    _currentIndex = 0;
    _timer = Timer.periodic(_animDuration, _type);
  }

  void _type(Timer timer) {
    if (_currentIndex < _text.length) {
      _currentIndex++;
      _data.value = currentText;
    } else {
      _timer?.cancel();
    }
  }

  ///life fun
  @override
  void initState() {
    super.initState();
    _startAnim();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _data.dispose();
    super.dispose();
  }

  ///build
  @override
  Widget build(_) => Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: _startAnim,
            child: AnimatedBuilder(
              animation: _data,
              builder: (_, __) => Text(
                '${_data.value}',
              ),
            ),
          ),
        ),
      );
}
