# Quiz Score System

A comprehensive quiz scoring system that tracks user performance and displays detailed results at the end of each quiz session.

## 🎯 **Features**

### **1. Quiz Score View (`quiz_score_view.dart`)**
- **Modern UI Design**: Gradient headers, card-based layout, and smooth animations
- **Score Overview**: Circular progress indicator with color-coded results
- **Statistics Cards**: Visual breakdown of correct, incorrect, and skipped questions
- **Performance Metrics**: Time tracking, accuracy percentage, and average time per question
- **Question Results**: Detailed list of each question with individual results
- **Action Buttons**: Retake quiz or return to lessons

### **2. Session Tracking (`quiz_session_provider.dart`)**
- **State Management**: Riverpod provider for quiz session data
- **Real-time Tracking**: Records answers, time, and performance metrics
- **Session Persistence**: Maintains data throughout the quiz session
- **Reset Functionality**: Clean slate for new quiz attempts

### **3. Integration with Quiz Flow**
- **Automatic Navigation**: Seamlessly transitions from quiz to score view
- **Data Collection**: Tracks all user interactions and responses
- **Performance Analysis**: Calculates comprehensive statistics

## 📊 **Score Display Components**

### **Header Section**
- Quiz title with completion celebration
- Gradient background with quiz icon
- Professional visual design

### **Score Overview**
- Large circular progress indicator
- Color-coded based on performance:
  - 🟢 Green (90%+): Excellent
  - 🔵 Blue (70-89%): Good Job
  - 🟠 Orange (50-69%): Keep Trying
  - 🔴 Red (<50%): Need Practice
- Accuracy percentage display

### **Statistics Cards**
- **Correct Answers**: Green card with check icon
- **Incorrect Answers**: Red card with X icon
- **Skipped Questions**: Orange card with skip icon
- Each card shows count and percentage

### **Performance Breakdown**
- **Time Taken**: Total quiz duration
- **Questions Attempted**: Progress through quiz
- **Average Time**: Time per question calculation
- **Visual Indicators**: Icons and color coding

### **Question Results List**
- Individual question performance
- Correct/incorrect indicators
- Time spent per question
- Visual feedback for each result

## 🔧 **Usage**

### **1. In Quiz Detail View**
```dart
// Track quiz session
final sessionNotifier = ref.read(quizSessionProvider.notifier);
sessionNotifier.startQuiz(quiz.title);

// Record answers
sessionNotifier.recordAnswer(QuizQuestionResult(
  isCorrect: isCorrect,
  timeTaken: questionTime,
  selectedOption: selectedOption,
  correctOption: correctOptionIndex,
));

// Navigate to score view when quiz completes
_navigateToScoreView(quizTitle, totalQuestions);
```

### **2. Score View Navigation**
```dart
Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => QuizScoreView(
      levelId: levelId,
      unitId: unitId,
      lessonId: lessonId,
      quizTitle: quizTitle,
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      incorrectAnswers: incorrectAnswers,
      skippedQuestions: skippedQuestions,
      questionResults: questionResults,
      timeTaken: timeTaken,
    ),
  ),
);
```

## 📈 **Data Model**

### **QuizQuestionResult**
```dart
class QuizQuestionResult {
  final bool isCorrect;
  final Duration? timeTaken;
  final int? selectedOption;
  final int correctOption;
}
```

### **QuizSessionState**
```dart
class QuizSessionState {
  final DateTime? startTime;
  final List<QuizQuestionResult> questionResults;
  final int correctAnswers;
  final int incorrectAnswers;
  final int skippedQuestions;
  final String? currentQuizTitle;
  
  // Computed properties
  int get totalQuestions => questionResults.length;
  int get score => (correctAnswers / totalQuestions * 100).round();
  Duration? get timeTaken => DateTime.now().difference(startTime!);
}
```

## 🎨 **Design Features**

### **Color Scheme**
- **Primary**: Theme primary color for headers and buttons
- **Success**: Green for correct answers and high scores
- **Error**: Red for incorrect answers and low scores
- **Warning**: Orange for skipped questions and medium scores
- **Neutral**: Grey for secondary information

### **Visual Elements**
- **Shadows**: Subtle depth for cards and containers
- **Gradients**: Eye-catching headers and score circles
- **Icons**: Meaningful visual indicators throughout
- **Typography**: Clear hierarchy with proper font weights

### **Responsive Design**
- **Scrollable Content**: Handles varying content lengths
- **Flexible Layout**: Adapts to different screen sizes
- **Touch-Friendly**: Proper button sizes and spacing

## 🚀 **Future Enhancements**

### **Planned Features**
- **Score History**: Track performance over time
- **Achievement System**: Badges and milestones
- **Social Sharing**: Share results with friends
- **Analytics**: Detailed performance insights
- **Customization**: User preferences for display options

### **Integration Opportunities**
- **Backend Storage**: Save scores to user profile
- **Leaderboards**: Compare with other users
- **Progress Tracking**: Long-term learning analytics
- **Recommendations**: Suggest areas for improvement

## 📱 **Testing**

### **Sample Data**
The home view includes a test button that demonstrates the score view with sample data:
- 10 total questions
- 7 correct answers (70% score)
- 2 incorrect answers
- 1 skipped question
- 5 minutes 30 seconds completion time

### **Manual Testing**
1. Complete a quiz through the normal flow
2. Verify score calculation accuracy
3. Test navigation between views
4. Confirm data persistence during session
5. Validate responsive design on different screen sizes

This comprehensive scoring system provides users with detailed feedback on their quiz performance, encouraging continued learning and improvement! 🎉 