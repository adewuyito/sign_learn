import 'sign_learn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await dotenv.load(fileName: '.env');
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
