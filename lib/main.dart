import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    // await flutterTts.setSharedInstance(true);

    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize(
      onError: (_) => print("*********** $_ Error"),
      onStatus: (_) async {
        print("Status ***** $_");
        if (_ == "done") {
          await systemSpeak(lastWords);
        }
      },
    );
    setState(() {});
  }

  Future<void> startListening() async {
    print("Listening ...");
    await speechToText.listen(
      listenFor: const Duration(seconds: 20),
      pauseFor: const Duration(seconds: 5),
      onResult: onSpeechResult,
    );
    setState(() {});
  }

  Future<void> stopListening() async {
    print("Stoped");
    await speechToText.stop();
    // await systemSpeak(lastWords);
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    print(result.recognizedWords);
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    print("Iam working!!");
    await flutterTts.speak(content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Transform.rotate(
            angle: pi,
            child: Text(
              lastWords == "" ? "Welcome Fellow's" : lastWords,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            setState(() {});
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        label: const SizedBox(
          height: 20,
          width: 250,
          child: Text(
            "Press Me",
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
