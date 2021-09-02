import 'package:flutter/material.dart';
import '2_text_typer.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(_) => MaterialApp(
        // home: ColorfulText(),
        home: TextTyper(),
      );
}
