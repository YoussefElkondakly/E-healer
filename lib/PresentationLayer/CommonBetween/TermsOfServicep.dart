import 'package:flutter/material.dart';
class terms extends StatefulWidget {
  const terms({Key? key}) : super(key: key);

  @override
  State<terms> createState() => _termsState();
}

class _termsState extends State<terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("terms"),),
      body: Center(child: Text("Hi"),),
    );
  }
}
