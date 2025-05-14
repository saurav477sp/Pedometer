import 'package:flutter/material.dart';

class Statictics extends StatefulWidget {
  const Statictics({super.key});

  @override
  State<Statictics> createState() => _StaticticsState();
}

class _StaticticsState extends State<Statictics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('statictics page')));
  }
}
