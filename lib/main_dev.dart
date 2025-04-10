import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_learn/sign_learn.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: '.env');
  // final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      overrides: [
        // sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: SignLearnApp(),
    ),
  );
}
