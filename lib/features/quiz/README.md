# Quiz Feature Implementation

This document describes the newly implemented quiz feature for the Sign Learn application.

## Overview

The quiz feature provides a comprehensive system for creating and taking quizzes with support for different question types including text, image, and video questions.

## Architecture

### Models (`lib/features/quiz/models/`)

#### QuizQuestion
- Represents a single quiz question
- Supports three question types: text, image, video
- Contains options, correct answer index, and explanation
- Provides JSON serialization/deserialization
- Includes `isAnswerCorrect()` method for validation

#### QuizSession
- Manages the entire quiz session state
- Tracks current question, user answers, and progress
- Provides navigation helpers (`canMoveToNext`, `canMoveToPrevious`)
- Calculates score and progress automatically
- Immutable with `copyWith()` for state updates

### Controllers (`lib/features/quiz/controllers/`)

#### QuizController
- Riverpod StateNotifier for quiz state management
- Handles quiz initialization, navigation, and completion
- Provides answer validation and error handling
- Includes reset and clear functionality

### Views (`lib/features/quiz/views/`)

#### QuizScreen
- Main quiz interface with navigation
- Handles quiz initialization with sample data
- Shows detailed completion dialog with results
- Includes retry functionality

#### QuizProgressIndicator
- Visual progress bar showing quiz completion
- Connected to quiz session state

#### QuestionDisplay
- Displays current question text
- Placeholder support for image/video media
- Responsive layout

#### AnswerGrid
- Grid layout for answer options
- Visual feedback for selected answers
- Touch interaction handling

## Usage

### Basic Integration

```dart
import 'package:sign_learn/features/quiz/quiz.dart';

// Navigate to quiz screen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => QuizScreen(lessonId: 'lesson_123'),
  ),
);
```

### Creating Quiz Questions

```dart
final questions = [
  QuizQuestion(
    id: '1',
    question: 'What does this sign mean?',
    type: QuestionType.text,
    options: ['Hello', 'Goodbye', 'Thank you', 'Please'],
    correctOptionIndex: 0,
    explanation: 'This sign means "Hello" in sign language.',
  ),
  QuizQuestion(
    id: '2',
    question: 'Which sign represents "Thank you"?',
    type: QuestionType.image,
    mediaUrl: 'https://example.com/thankyou.jpg',
    options: ['Sign A', 'Sign B', 'Sign C', 'Sign D'],
    correctOptionIndex: 2,
    explanation: 'This is the correct sign for "Thank you".',
  ),
];

// Initialize quiz
ref.read(quizControllerProvider.notifier).initializeQuiz(questions);
```

### State Management

```dart
// Watch quiz session state
final quizSession = ref.watch(quizControllerProvider);

// Access quiz controller
final quizController = ref.read(quizControllerProvider.notifier);

// Navigation
quizController.moveToNext();
quizController.moveToPrevious();

// Answer handling
quizController.answerQuestion(selectedIndex);

// Quiz management
quizController.completeQuiz();
quizController.resetQuiz();
quizController.clearQuiz();
```

## Features

### Current Features
- ✅ Text-based questions
- ✅ Multiple choice answers (2-4 options)
- ✅ Progress tracking
- ✅ Score calculation
- ✅ Question navigation (next/previous)
- ✅ Quiz completion with detailed results
- ✅ Reset and retry functionality
- ✅ Error handling and validation
- ✅ Visual feedback for selected answers
- ✅ Responsive UI design

### Planned Features
- 🔄 Image question display
- 🔄 Video question display
- 🔄 Backend integration for quiz data
- 🔄 Results persistence
- 🔄 Question shuffling
- 🔄 Time limits
- 🔄 Hint system
- 🔄 Analytics tracking

## File Structure

```
lib/features/quiz/
├── models/
│   ├── quiz_question.dart      # Question model with JSON support
│   └── quiz_session.dart       # Session state management
├── controllers/
│   └── quiz_controller.dart    # Riverpod state management
├── views/
│   ├── quiz_screen.dart        # Main quiz interface
│   ├── quiz_progress.dart      # Progress indicator
│   ├── question_display.dart   # Question content display
│   └── answer_grid.dart        # Answer options grid
└── quiz.dart                   # Feature exports

test/features/quiz/
└── quiz_models_test.dart       # Unit tests for models
```

## Testing

Unit tests are included for the core models:

```bash
flutter test test/features/quiz/quiz_models_test.dart
```

Tests cover:
- QuizQuestion creation and validation
- JSON serialization/deserialization
- Answer correctness checking
- QuizSession state management
- Navigation logic
- Score calculation

## Integration Notes

The quiz feature is designed to be self-contained and can be easily integrated with:
- Existing lesson system
- User progress tracking
- Backend APIs for question data
- Analytics and reporting systems

The implementation follows the existing app patterns:
- Riverpod for state management
- Immutable models with copyWith()
- Material Design UI components
- Consistent error handling