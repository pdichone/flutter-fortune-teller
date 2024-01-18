import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Fortune Sayings',
      theme: ThemeData(
        scaffoldBackgroundColor: Theme.of(context).colorScheme.background,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = "";

  final _fortuneList = [
    "A beautiful, smart, and loving person will be coming into your life.",
    "A dubious friend may be an enemy in camouflage.",
    "A faithful friend is a strong defense.",
    "A feather in the hand is better than a bird in the air.",
    "A fresh start will put you on your way.",
    "A friend asks only for your time not your money.",
    "A friend is a present you give yourself.",
    "A gambler not only will lose what he has, but also will lose what he doesn’t have.",
    "A golden egg of opportunity falls into your lap this month.",
    "A good friendship is often more important than a passionate romance.",
    "A good time to finish up old tasks.",
    "A hunch is creativity trying to tell you something.",
    "A lifetime friend shall soon be made.",
    "A lifetime of happiness lies ahead of you.",
    "A light heart carries you through all the hard times.",
    "A new perspective will come with the new year.",
    "A person is never too old to learn.",
    "A person of words and not deeds is like a garden full of weeds.",
    "A pleasant surprise is waiting for you.",
    "A short pencil is usually better than a long memory any day.",
    "A small donation is call for. It’s the right thing to do.",
    "A smile is your personal welcome mat.",
    "A smooth long journey! Great expectations.",
    "A soft voice may be awfully persuasive.",
    "A truly rich life contains love and art in abundance.",
    "Accept something that you cannot change, and you will feel better.",
    "Adventure can be real happiness.",
  ];

  void _randomFortune() {
    var random = Random();
    int fortune = random.nextInt(_fortuneList.length);
    Logger.root.info("Fortune: $fortune");
    setState(() {
      _currentFortune = _fortuneList[fortune];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/fortune_cookie.png",
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  style: Theme.of(context).textTheme.titleMedium,
                  _currentFortune,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: _randomFortune,
                child: const Text("Tell me a Fortune")),
          ],
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
