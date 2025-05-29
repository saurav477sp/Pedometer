import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) => Text('saurav'),
            itemCount: 50,
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
