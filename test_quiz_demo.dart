import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../features/quiz/presentation/sign_quiz_view.dart';
import '../core/constants/dimensions.dart';

void main() {
  runApp(const QuizDemoApp());
}

class QuizDemoApp extends StatelessWidget {
  const QuizDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Quiz Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const QuizDemoScreen(),
      ),
    );
  }
}

class QuizDemoScreen extends ConsumerWidget {
  const QuizDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize dimensions
    Dims.setSize(MediaQuery.of(context));
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Demo'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Duolingo-Style Quiz System',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Quiz system has been implemented with:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('✅ Multiple choice questions (5 questions)'),
                Text('✅ Progress indicator'),
                Text('✅ Answer feedback (correct/incorrect)'),
                Text('✅ Retry functionality'),
                Text('✅ Final score display'),
                Text('✅ Navigation between questions'),
                Text('✅ State management with Riverpod'),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'The quiz system is ready and integrated into SignQuizView.',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}