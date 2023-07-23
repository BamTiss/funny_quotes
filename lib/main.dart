import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Color> colorList = [
     Colors.black,
     Colors.red,
     Colors.green,
     Colors.yellow,
     Colors.blue,
     Colors.black87,
  ];
  var colorC = colorList[0];
  static const List<String> _quoteList = [
    'ถึงนักการเมืองจะหมดความชอบธรรม แต่ฉันไม่มีวันหมดชอบเธอ',
    'เลือกตั้งให้ไปที่เขต ถ้าอยากออกเดตให้มาที่เรา',
    'ตอนเด็กเข้าใจว่าเลือกแล้วเลือกเลย โตมาจึงรู้ว่าเลือกแล้วเลือกใหม่',
    'อยากได้ผู้นำประเทศให้เลือกตั้ง แต่ถ้าอยากได้แฟนแบบจริงจัง ต้องเลือกเรา',
    'ถ้าท็อปนิวคือสื่อน้ำดี คลองแสนแสบก็คือน้ำดื่ม',
  ];
  var _quote = _quoteList[0];
  void _handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(_quoteList.length);
      _quote = _quoteList[randomIndex];

      var randC = Random();
      var randomColor = randC.nextInt(colorList.length);
      colorC = colorList[randomColor];
    });
    

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('ใครไม่คม คำคม')),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            _quote,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorC,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,


            ),
          ),
        ),
      ),
    );
  }
}