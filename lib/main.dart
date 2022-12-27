import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:statsfl/statsfl.dart';

import 'app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(kDebugMode
      ? StatsFl(
          isEnabled: true,
          width: 600,
          height: 20,
          maxFps: 90,
          showText: true,
          sampleTime: .5,
          totalTime: 15,
          align: Alignment.topLeft,
          child: const App())
      : const App());
}
