import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
// ~ Move this to the backend application
@RoutePage()
class FirebaseFirestoreUpload extends ConsumerStatefulWidget {
  const FirebaseFirestoreUpload({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirebaseFirestoreUploadState();
}

class _FirebaseFirestoreUploadState extends ConsumerState<FirebaseFirestoreUpload> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Firestore Upload'),
      ),
      body: ElevatedButton(
        onPressed: () {
          FirestoreService.createCollectionsBatch();
        },
        child: const Text('Create Nested Collections'),
      ),
    );
  }
}


class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method 1: Create nested collections using subcollections
  static Future<void> createNestedCollections() async {
    try {
      // Create the main lesson document
      DocumentReference lessonRef = _firestore.collection('lessons').doc('asl_lesson1');
      
      // Set lesson data
      await lessonRef.set({
        'title': 'ASL Lesson 1',
        'description': 'Introduction to American Sign Language',
        'createdAt': FieldValue.serverTimestamp(),
        'isActive': true,
        'difficulty': 'beginner',
      });

      // Create unit subcollection
      DocumentReference unitRef = lessonRef.collection('units').doc('unit1');
      
      // Set unit data
      await unitRef.set({
        'title': 'Unit 1: Basic Signs',
        'description': 'Learn basic ASL signs',
        'order': 1,
        'createdAt': FieldValue.serverTimestamp(),
        'isCompleted': false,
      });

      // Create lesson subcollection under unit
      DocumentReference lessonItemRef = unitRef.collection('lessons').doc('lesson1');
      
      // Set individual lesson data
      await lessonItemRef.set({
        'title': 'Lesson 1: Alphabet',
        'content': 'Learn the ASL alphabet',
        'videoUrl': 'https://example.com/video1',
        'duration': 300, // 5 minutes in seconds
        'order': 1,
        'createdAt': FieldValue.serverTimestamp(),
        'isCompleted': false,
        'questions': [
          {
            'question': 'What is the sign for letter A?',
            'options': ['Option 1', 'Option 2', 'Option 3'],
            'correctAnswer': 0,
          }
        ],
      });

      print('Nested collections created successfully!');
    } catch (e) {
      print('Error creating collections: $e');
    }
  }

  // Method 2: Create using batch writes for better performance
  static Future<void> createCollectionsBatch() async {
    try {
      WriteBatch batch = _firestore.batch();

      // Lesson document
      DocumentReference lessonRef = _firestore.collection('lessons').doc('asl_lesson1');
      batch.set(lessonRef, {
        'title': 'ASL Lesson 1',
        'description': 'Introduction to American Sign Language',
        'createdAt': FieldValue.serverTimestamp(),
        'isActive': true,
        'difficulty': 'beginner',
        'totalUnits': 3,
      });

      // Multiple units as collections with lessons as documents
      for (int i = 1; i <= 3; i++) {
        // Calculate lesson numbers for each unit
        int startLesson = (i - 1) * 5 + 1; // Unit1: 1, Unit2: 6, Unit3: 11
        int endLesson = i * 5;               // Unit1: 5, Unit2: 10, Unit3: 15
        
        // Create lessons in unit collections
        for (int lessonNum = startLesson; lessonNum <= endLesson; lessonNum++) {
          DocumentReference lessonRef = _firestore.collection('unit$i').doc('lesson$lessonNum');
          batch.set(lessonRef, {
            'title': 'Lesson $lessonNum',
            'content': 'Learn specific ASL signs for lesson $lessonNum',
            'videoUrl': 'https://example.com/unit${i}_lesson$lessonNum',
            'duration': 300 + (lessonNum * 30), // Variable duration
            'order': lessonNum,
            'unitNumber': i,
            'createdAt': FieldValue.serverTimestamp(),
            'isCompleted': false,
            'difficulty': lessonNum <= 5 ? 'easy' : lessonNum <= 10 ? 'medium' : 'hard',
          });
        }
      }

      await batch.commit();
      print('Batch collections created successfully!');
    } catch (e) {
      print('Error creating batch collections: $e');
    }
  }


  // Method 3: Alternative flat structure with path-like document IDs
  static Future<void> createFlatStructure() async {
    try {
      // Create documents with path-like IDs
      await _firestore.collection('lesson_content').doc('asl_lesson1_unit1_lesson1').set({
        'lessonPath': 'lessons/asl_lesson1/units/unit1/lessons/lesson1',
        'lessonId': 'asl_lesson1',
        'unitId': 'unit1',
        'lessonItemId': 'lesson1',
        'title': 'ASL Lesson 1 - Unit 1 - Lesson 1',
        'content': 'Introduction to ASL alphabet',
        'videoUrl': 'https://example.com/asl_lesson1_unit1_lesson1',
        'duration': 300,
        'order': 1,
        'createdAt': FieldValue.serverTimestamp(),
        'tags': ['asl', 'alphabet', 'beginner'],
      });

      print('Flat structure created successfully!');
    } catch (e) {
      print('Error creating flat structure: $e');
    }
  }

  // Method 4: Create with data models
  static Future<void> createWithModels() async {
    try {
      // Create lesson
      Lesson lesson = Lesson(
        id: 'asl_lesson1',
        title: 'ASL Lesson 1',
        description: 'Introduction to American Sign Language',
        difficulty: 'beginner',
        createdAt: DateTime.now(),
      );

      await _firestore.collection('lessons').doc(lesson.id).set(lesson.toMap());

      // Create unit
      Unit unit = Unit(
        id: 'unit1',
        title: 'Unit 1: Basic Signs',
        description: 'Learn basic ASL signs',
        order: 1,
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('lessons')
          .doc(lesson.id)
          .collection('units')
          .doc(unit.id)
          .set(unit.toMap());

      // Create lesson item
      LessonItem lessonItem = LessonItem(
        id: 'lesson1',
        title: 'Lesson 1: Alphabet',
        content: 'Learn the ASL alphabet',
        videoUrl: 'https://example.com/video1',
        duration: 300,
        order: 1,
        createdAt: DateTime.now(),
      );

      await _firestore
          .collection('lessons')
          .doc(lesson.id)
          .collection('units')
          .doc(unit.id)
          .collection('lessons')
          .doc(lessonItem.id)
          .set(lessonItem.toMap());

      print('Collections created with models successfully!');
    } catch (e) {
      print('Error creating collections with models: $e');
    }
  }

  // Query methods
  static Future<void> queryNestedData() async {
    try {
      // Get all lessons in a unit
      QuerySnapshot lessons = await _firestore
          .collection('lessons')
          .doc('asl_lesson1')
          .collection('units')
          .doc('unit1')
          .collection('lessons')
          .orderBy('order')
          .get();

      print('Found ${lessons.docs.length} lessons');
      
      for (var doc in lessons.docs) {
        print('Lesson: ${doc.data()}');
      }
    } catch (e) {
      print('Error querying data: $e');
    }
  }

  // Update nested document
  static Future<void> updateLessonProgress() async {
    try {
      await _firestore
          .collection('lessons')
          .doc('asl_lesson1')
          .collection('units')
          .doc('unit1')
          .collection('lessons')
          .doc('lesson1')
          .update({
        'isCompleted': true,
        'completedAt': FieldValue.serverTimestamp(),
        'progress': 100,
      });

      print('Lesson progress updated successfully!');
    } catch (e) {
      print('Error updating lesson progress: $e');
    }
  }
}

// Data Models
class Lesson {
  final String id;
  final String title;
  final String description;
  final String difficulty;
  final DateTime createdAt;
  final bool isActive;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.createdAt,
    this.isActive = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'createdAt': Timestamp.fromDate(createdAt),
      'isActive': isActive,
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map, String id) {
    return Lesson(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      difficulty: map['difficulty'] ?? 'beginner',
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      isActive: map['isActive'] ?? true,
    );
  }
}

class Unit {
  final String id;
  final String title;
  final String description;
  final int order;
  final DateTime createdAt;
  final bool isCompleted;

  Unit({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    required this.createdAt,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'order': order,
      'createdAt': Timestamp.fromDate(createdAt),
      'isCompleted': isCompleted,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map, String id) {
    return Unit(
      id: id,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      order: map['order'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}

class LessonItem {
  final String id;
  final String title;
  final String content;
  final String videoUrl;
  final int duration;
  final int order;
  final DateTime createdAt;
  final bool isCompleted;

  LessonItem({
    required this.id,
    required this.title,
    required this.content,
    required this.videoUrl,
    required this.duration,
    required this.order,
    required this.createdAt,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'videoUrl': videoUrl,
      'duration': duration,
      'order': order,
      'createdAt': Timestamp.fromDate(createdAt),
      'isCompleted': isCompleted,
    };
  }

  factory LessonItem.fromMap(Map<String, dynamic> map, String id) {
    return LessonItem(
      id: id,
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      duration: map['duration'] ?? 0,
      order: map['order'] ?? 0,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}
