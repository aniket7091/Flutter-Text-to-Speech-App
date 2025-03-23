import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_to_speech/presentation/provider/provider_text.dart';
import 'package:text_to_speech/presentation/screen/text_to_Speech.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase Initialization Error: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TextToSpeechProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TextToSpeechScreen(),
      ),
    );
  }
}
