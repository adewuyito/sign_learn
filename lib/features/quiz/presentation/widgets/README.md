# Multi-Choice Widget

A reusable multi-choice widget with state management using Riverpod providers for quiz applications.

## Features

- ✅ Single option selection (radio button behavior)
- ✅ Visual feedback for correct/incorrect answers
- ✅ State management with Riverpod providers
- ✅ Customizable styling
- ✅ Disabled state support
- ✅ Accessibility friendly

## Components

### 1. MultiChoiceWidget

The main widget that renders the multi-choice options.

```dart
MultiChoiceWidget(
  options: question.options,
  correctOptionIndex: question.correctOptionIndex,
  showFeedback: showFeedback,
  isCorrect: isCorrect,
  onOptionSelected: (index) {
    // Handle option selection
  },
  disabled: false, // Optional
)
```

### 2. Providers

Three providers manage the widget state:

- `selectedOptionProvider`: Tracks the currently selected option index
- `showFeedbackProvider`: Controls whether to show feedback
- `isCorrectProvider`: Stores whether the selected answer is correct

### 3. MultiChoiceController

Helper class to manage the widget state:

```dart
// Reset all state
MultiChoiceController.reset(ref);

// Show feedback
MultiChoiceController.showFeedback(ref, isCorrect);
```

## Usage Example

```dart
class QuizView extends ConsumerStatefulWidget {
  @override
  ConsumerState<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends ConsumerState<QuizView> {
  @override
  Widget build(BuildContext context) {
    final selectedOption = ref.watch(selectedOptionProvider);
    final showFeedback = ref.watch(showFeedbackProvider);
    final isCorrect = ref.watch(isCorrectProvider);

    return Scaffold(
      body: Column(
        children: [
          // Question content...
          
          MultiChoiceWidget(
            options: question.options,
            correctOptionIndex: question.correctOptionIndex,
            showFeedback: showFeedback,
            isCorrect: isCorrect,
            onOptionSelected: (index) {
              debugPrint('Selected option: $index');
            },
          ),
          
          // Action buttons...
          ElevatedButton(
            onPressed: selectedOption == null ? null : () {
              if (!showFeedback) {
                final isCorrectAnswer = selectedOption == question.correctOptionIndex;
                MultiChoiceController.showFeedback(ref, isCorrectAnswer);
              } else {
                // Move to next question
                MultiChoiceController.reset(ref);
              }
            },
            child: Text(showFeedback ? 'Next' : 'Submit'),
          ),
        ],
      ),
    );
  }
}
```

## State Flow

1. **Initial State**: No option selected, no feedback shown
2. **Selection**: User selects an option → `selectedOptionProvider` updates
3. **Submit**: User submits answer → `showFeedbackProvider` and `isCorrectProvider` update
4. **Feedback**: Correct/incorrect options are highlighted
5. **Reset**: Move to next question → All providers reset

## Styling

The widget uses a modern design with:
- Rounded corners (12px border radius)
- Color-coded feedback (green for correct, red for incorrect)
- Radio button indicators
- Hover effects with InkWell
- Responsive layout

## Integration with Existing Quiz

The widget is designed to work seamlessly with the existing quiz models:

- `QuizOptionModel`: Provides option text and ID
- `QuizQuestionModel`: Contains options list and correct answer index
- `MediaType`: Supports image and video questions

## Example Views

- `ExampleMultiChoiceView`: Simple demonstration with sample data
- `QuizViewWithMultiChoice`: Full quiz implementation using the widget

## Best Practices

1. Always wrap your quiz view with `ConsumerStatefulWidget` or `ConsumerWidget`
2. Use the providers to watch state changes
3. Reset state when moving between questions
4. Handle loading and error states appropriately
5. Provide clear feedback to users 