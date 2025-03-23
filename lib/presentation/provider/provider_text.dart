import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechProvider extends ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isSpeaking = false; //  Fix: isSpeaking State

  bool get isSpeaking => _isSpeaking;

  Future<void> speak(String text) async {
    _isSpeaking = true;
    notifyListeners();

    await _flutterTts.setLanguage("en-IN"); //  Set Indian English
    await _flutterTts.setPitch(1); // Higher pitch for Female Voice
    await _flutterTts.setSpeechRate(0.5); // Adjust speed

    _flutterTts.setCompletionHandler(() {
      _isSpeaking = false;
      notifyListeners();
    });

    await _flutterTts.speak(text);
  }
}
