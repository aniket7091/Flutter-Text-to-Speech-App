import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import '../provider/provider_text.dart';

class TextToSpeechScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TextToSpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TextToSpeechProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white, // Light Mode Background
      appBar: AppBar(
        title: Text(
          "Text to Speech",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            /// Shiny Speech Icon
            BounceInDown(
              child: Icon(
                Icons.record_voice_over_rounded,
                size: 100,
                color: Colors.blueAccent.shade200,
                shadows: [
                  Shadow(color: Colors.blueAccent, blurRadius: 15),
                ],
              ),
            ),

            SizedBox(height: 20),

            /// Dysmorphic TextField
            FadeInLeft(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Transparent Light Mode Input
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  controller: _controller,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Type something...",
                    hintStyle: GoogleFonts.poppins(color: Colors.black45),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            /// Monomorphic Speak Button
            FadeInUp(
              child: GestureDetector(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    provider.speak(_controller.text);
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent.shade200, Colors.purpleAccent.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "🎙 Speak Now",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            /// Live Voice Indicator
            provider.isSpeaking
                ? ZoomIn(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Icon(Icons.graphic_eq, size: 50, color: Colors.blueAccent),
                  Text(
                    "Speaking...",
                    style: GoogleFonts.poppins(color: Colors.black54),
                  ),
                ],
              ),
            )
                : SizedBox(),
          ],
        ),
      ),

      /// Floating Microphone Button (with Glow Effect)
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.8),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              provider.speak(_controller.text);
            }
          },
          backgroundColor: Colors.blueAccent.shade200,
          child: Icon(Icons.mic, color: Colors.white, size: 30),
        ),
      ),
    );
  }
}
