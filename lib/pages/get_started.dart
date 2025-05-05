import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/body_big.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  late ColorScheme _colorScheme;
  @override
  Widget build(BuildContext context) {
    _colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: _colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child:
                  Image.asset('assets/images/Active elderly people-bro 1.png'),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: const BodyBig(text: 'work out get')
                ),
                RichText(
                    text: TextSpan(
                        // style: TextStyle(
                        //     color: _colorScheme.secondary,
                        //     fontSize: 35,
                        //     fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      const TextSpan(text: 'better as'),
                      TextSpan(
                          text: ' you do',
                          style: TextStyle(color: _colorScheme.onPrimary)),
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

