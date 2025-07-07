import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sign_learn/features/shared/presentation/video_widget.dart';


// Firebase Storage Service
class FirebaseStorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String?> getLessonVideo({
    required String course,
    required String unit,
    required String lesson,
    String fileName = '260397_tiny.mp4',
  }) async {
    try {
      String videoPath = 'lessons/$course/$unit/$lesson/$fileName';
      Reference videoRef = _storage.ref().child(videoPath);
      String downloadUrl = await videoRef.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error getting lesson video: $e');
      return null;
    }
  }
}


// Lesson Screen that manages the entire lesson
class LessonScreen extends HookWidget {
  final String course;
  final String unit;
  final String lesson;

  const LessonScreen({
    super.key,
    required this.course,
    required this.unit,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    final isVideoCompleted = useState(false);
    final videoStarted = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text('$course - $unit - $lesson'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //~ Video Player
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: LessonVideoPlayer(
                  course: course,
                  unit: unit,
                  lesson: lesson,
                  onVideoStart: () {
                    videoStarted.value = true;
                  },
                  onVideoComplete: () {
                    isVideoCompleted.value = true;
                    // Mark lesson as completed, update progress, etc.
                  },
                ),
              ),
            ),

            SizedBox(height: 16),

            // Lesson Content
            Text(
              'Lesson Content',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            SizedBox(height: 8),

            Text(
              'This is the lesson content that goes with the video. '
              'You can add instructions, explanations, or any other content here.',
            ),

            SizedBox(height: 16),

            //~ Progress Indicator
            if (videoStarted.value)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        isVideoCompleted.value
                            ? Icons.check_circle
                            : Icons.play_circle,
                        color:
                            isVideoCompleted.value ? Colors.green : Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Text(
                        isVideoCompleted.value
                            ? 'Video completed!'
                            : 'Video in progress...',
                        style: TextStyle(
                          color: isVideoCompleted.value
                              ? Colors.green
                              : Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: 16),

            //~ Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: isVideoCompleted.value
                      ? () {
                          // Navigate to next lesson
                          print('Navigate to next lesson');
                        }
                      : null,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

@RoutePage()
// Lesson List Widget
class LessonListWidget extends HookWidget {
  final String course;
  final String unit;
  final List<String> lessons;

  const LessonListWidget({
    super.key,
    required this.course,
    required this.unit,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text('Lesson ${index + 1}'),
            subtitle: Text(lesson),
            trailing: Icon(Icons.play_arrow),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LessonScreen(
                    course: course,
                    unit: unit,
                    lesson: lesson,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// Main App Usage Example
// class VideoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ASL Learning App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: LessonListWidget(
//         course: 'ASL1',
//         unit: 'unit1',
//         lessons: ['lesson1', 'lesson2', 'lesson3', 'lesson4', 'lesson5'],
//       ),
//     );
//   }
// }
