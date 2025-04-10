import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/domain.dart';
import '../providers/lessons_provider.dart';
import './video_player.dart';


@RoutePage()
class LessonDetailScreen extends ConsumerWidget {
  final String lessonId;

  const LessonDetailScreen({super.key ,required this.lessonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lesson = ref.watch(lessonDetailProvider(lessonId));
    
    return Scaffold(
      appBar: AppBar(title: Text('Lesson Details')),
      body: lesson.when(
        data: (lesson) {
          return Column(
            children: [
              // Video Player
              VideoPlayerWidget(
                videoUrl: lesson.videoUrl,
              ),
              SizedBox(height: 20),
              
              // Transcript
            
              SizedBox(height: 20),
              
              // Quiz/Questions
              // LessonQuizWidget(lessonId: lesson.id),
              
              // Complete Button
              ElevatedButton(
                onPressed: () {
                  ref.read(completeLessonProvider).call(lesson.id);
                },
                child: Text('Mark as Completed'),
              ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, stack) => Center(child: Text('Error loading lesson')),
      ),
    );
  }
}
