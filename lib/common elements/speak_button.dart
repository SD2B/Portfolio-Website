// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class SpeakButton extends HookWidget {
//   @override
//   Widget build(BuildContext context) {
//     final flutterTts = useMemoized(() => FlutterTts());
//     final textToSpeak = '''
//     My name is Sanoop Das, and I am from Malappuram, Kerala. I am a Flutter developer focused on creating
//     multiplatform applications with seamless functionality and user-friendly design. Proficient in Flutter and Dart,
//     I develop solutions for Web, Android, iOS, Windows, macOS, and Linux, always prioritizing the user experience.
//     I am committed to continuously improving my skills and contributing to meaningful projects.

//     After completing my Bachelor’s degree in Computer Science, I pursued a Master’s degree in Computer Applications,
//     which gave me a solid foundation in programming and application development.

//     Currently, I am a freelance Flutter developer. My most notable works include:
//     - ISSELO: A restaurant management and POS software offering robust offline and online syncing features for uninterrupted service.
//     - Hozzo: India’s leading car wash application, where I introduced water-saving features, reducing usage by 40%.
//     ''';

//     Future<void> _speak() async {
//       await flutterTts.setLanguage('en-US');
//       await flutterTts.setPitch(1.0);
//       await flutterTts.speak(textToSpeak);
//     }

//     return ElevatedButton(
//       onPressed: _speak,
//       child: Text("Play Audio"),
//     );
//   }
// }
