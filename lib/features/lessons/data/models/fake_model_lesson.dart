import 'package:uuid/uuid.dart';

import 'lesson_model.dart';

// Helper to generate stable fake IDs
const _uuid = Uuid();

/// ─────────────────────────────────────────────
///  ASL‑1  • Unit‑1  •  Mock Lessons
/// ─────────────────────────────────────────────
final List<LessonModel> kMockLessonsUnit1 = [
  LessonModel(
    lessonId: _uuid.v4(), // e.g. "a1b2‑…"
    title: 'Greetings & Introductions',
    description: 'Learn how to sign hello, good‑bye, and introduce yourself.',
    videoUrls: [
      // Replace with real Firebase‐Storage or YouTube URLs
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    ],
    order: 1,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    parentLesson: "asl_lesson1",
    unitOrder: 2,
  ),
  LessonModel(
    lessonId: _uuid.v4(),
    title: 'Fingerspelling A‑M',
    description: 'Master the first half of the ASL alphabet.',
    videoUrls: [
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    ],
    order: 2,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    parentLesson: "asl_lesson1",
    unitOrder: 2,
  ),
  LessonModel(
    lessonId: _uuid.v4(),
    title: 'Numbers 1‑10',
    description: 'Count from one to ten using ASL.',
    videoUrls: [
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    ],
    order: 3,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    parentLesson: "asl_lesson1",
    unitOrder: 2,
  ),
];

/// Quick JSON print‑out if you need to seed Firestore manually
void printMockLessonJson() {
  for (final l in kMockLessonsUnit1) {
    // ignore: avoid_print
    print(l.toJson());
  }
}
