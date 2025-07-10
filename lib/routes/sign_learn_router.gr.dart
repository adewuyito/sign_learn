// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:sign_learn/common/commons.dart' as _i29;
import 'package:sign_learn/features/auth/presentation/auth_init_view.dart'
    as _i1;
import 'package:sign_learn/features/auth/presentation/views/login_view.dart'
    as _i12;
import 'package:sign_learn/features/auth/presentation/views/signup_view.dart'
    as _i23;
import 'package:sign_learn/features/dictionary/presentation/dictionary_entry_detail_view.dart'
    as _i2;
import 'package:sign_learn/features/dictionary/presentation/dictionary_view.dart'
    as _i4;
import 'package:sign_learn/features/dictionary/presentation/widgets/dictionary_widget.dart'
    as _i3;
import 'package:sign_learn/features/home/presentation/home_view.dart' as _i7;
import 'package:sign_learn/features/lessons/data/data.dart' as _i27;
import 'package:sign_learn/features/lessons/data/models/lesson_model.dart'
    as _i28;
import 'package:sign_learn/features/lessons/presentation/gpt_lesson_view.dart'
    as _i10;
import 'package:sign_learn/features/lessons/presentation/lesson_by_level_list.dart'
    as _i11;
import 'package:sign_learn/features/lessons/presentation/lesson_detail_screen.dart'
    as _i20;
import 'package:sign_learn/features/lessons/presentation/lesson_list_view.dart'
    as _i8;
import 'package:sign_learn/features/no_connection_view.dart' as _i13;
import 'package:sign_learn/features/profile/presentation/profile_edit_view.dart'
    as _i15;
import 'package:sign_learn/features/profile/presentation/profile_view.dart'
    as _i16;
import 'package:sign_learn/features/quiz/presentation/example_multi_choice_view.dart'
    as _i5;
import 'package:sign_learn/features/quiz/presentation/presentation.dart'
    as _i17;
import 'package:sign_learn/features/quiz/presentation/quiz_score_view.dart'
    as _i18;
import 'package:sign_learn/features/quiz/presentation/quiz_view_with_multi_choice.dart'
    as _i19;
import 'package:sign_learn/features/settings/presentation/settings_view.dart'
    as _i21;
import 'package:sign_learn/features/shared/advanced_video_palyer_imp.dart'
    as _i9;
import 'package:sign_learn/features/shared/signlearn_upload_file.dart' as _i6;
import 'package:sign_learn/features/sign_intro_view.dart' as _i14;
import 'package:sign_learn/features/skeleton_view.dart' as _i24;
import 'package:sign_learn/features/splash_view.dart' as _i22;

/// generated route for
/// [_i1.AuthInitPage]
class AuthInitRoute extends _i25.PageRouteInfo<void> {
  const AuthInitRoute({List<_i25.PageRouteInfo>? children})
    : super(AuthInitRoute.name, initialChildren: children);

  static const String name = 'AuthInitRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthInitPage();
    },
  );
}

/// generated route for
/// [_i2.DictionaryEntryDetailView]
class DictionaryEntryDetailRoute
    extends _i25.PageRouteInfo<DictionaryEntryDetailRouteArgs> {
  DictionaryEntryDetailRoute({
    required String videoId,
    _i26.Key? key,
    required String youtubeUrl,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         DictionaryEntryDetailRoute.name,
         args: DictionaryEntryDetailRouteArgs(
           videoId: videoId,
           key: key,
           youtubeUrl: youtubeUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'DictionaryEntryDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DictionaryEntryDetailRouteArgs>();
      return _i2.DictionaryEntryDetailView(
        args.videoId,
        key: args.key,
        youtubeUrl: args.youtubeUrl,
      );
    },
  );
}

class DictionaryEntryDetailRouteArgs {
  const DictionaryEntryDetailRouteArgs({
    required this.videoId,
    this.key,
    required this.youtubeUrl,
  });

  final String videoId;

  final _i26.Key? key;

  final String youtubeUrl;

  @override
  String toString() {
    return 'DictionaryEntryDetailRouteArgs{videoId: $videoId, key: $key, youtubeUrl: $youtubeUrl}';
  }
}

/// generated route for
/// [_i3.DictionaryEntryPage]
class DictionaryEntryRoute extends _i25.PageRouteInfo<void> {
  const DictionaryEntryRoute({List<_i25.PageRouteInfo>? children})
    : super(DictionaryEntryRoute.name, initialChildren: children);

  static const String name = 'DictionaryEntryRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i3.DictionaryEntryPage();
    },
  );
}

/// generated route for
/// [_i4.DictionaryView]
class DictionaryRoute extends _i25.PageRouteInfo<void> {
  const DictionaryRoute({List<_i25.PageRouteInfo>? children})
    : super(DictionaryRoute.name, initialChildren: children);

  static const String name = 'DictionaryRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i4.DictionaryView();
    },
  );
}

/// generated route for
/// [_i5.ExampleMultiChoiceView]
class ExampleMultiChoiceRoute extends _i25.PageRouteInfo<void> {
  const ExampleMultiChoiceRoute({List<_i25.PageRouteInfo>? children})
    : super(ExampleMultiChoiceRoute.name, initialChildren: children);

  static const String name = 'ExampleMultiChoiceRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i5.ExampleMultiChoiceView();
    },
  );
}

/// generated route for
/// [_i6.FirebaseFirestoreUpload]
class FirebaseFirestoreUpload extends _i25.PageRouteInfo<void> {
  const FirebaseFirestoreUpload({List<_i25.PageRouteInfo>? children})
    : super(FirebaseFirestoreUpload.name, initialChildren: children);

  static const String name = 'FirebaseFirestoreUpload';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i6.FirebaseFirestoreUpload();
    },
  );
}

/// generated route for
/// [_i7.HomeView]
class HomeRoute extends _i25.PageRouteInfo<void> {
  const HomeRoute({List<_i25.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeView();
    },
  );
}

/// generated route for
/// [_i8.LessonListScreen]
class LessonListRoute extends _i25.PageRouteInfo<LessonListRouteArgs> {
  LessonListRoute({
    _i26.Key? key,
    required _i27.CategoryLevel categoryLevel,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         LessonListRoute.name,
         args: LessonListRouteArgs(key: key, categoryLevel: categoryLevel),
         initialChildren: children,
       );

  static const String name = 'LessonListRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonListRouteArgs>();
      return _i8.LessonListScreen(
        key: args.key,
        categoryLevel: args.categoryLevel,
      );
    },
  );
}

class LessonListRouteArgs {
  const LessonListRouteArgs({this.key, required this.categoryLevel});

  final _i26.Key? key;

  final _i27.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonListRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i9.LessonListWidget]
class LessonListWidget extends _i25.PageRouteInfo<LessonListWidgetArgs> {
  LessonListWidget({
    _i26.Key? key,
    required String course,
    required String unit,
    required List<String> lessons,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         LessonListWidget.name,
         args: LessonListWidgetArgs(
           key: key,
           course: course,
           unit: unit,
           lessons: lessons,
         ),
         initialChildren: children,
       );

  static const String name = 'LessonListWidget';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonListWidgetArgs>();
      return _i9.LessonListWidget(
        key: args.key,
        course: args.course,
        unit: args.unit,
        lessons: args.lessons,
      );
    },
  );
}

class LessonListWidgetArgs {
  const LessonListWidgetArgs({
    this.key,
    required this.course,
    required this.unit,
    required this.lessons,
  });

  final _i26.Key? key;

  final String course;

  final String unit;

  final List<String> lessons;

  @override
  String toString() {
    return 'LessonListWidgetArgs{key: $key, course: $course, unit: $unit, lessons: $lessons}';
  }
}

/// generated route for
/// [_i10.LessonPage]
class LessonRoute extends _i25.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    _i26.Key? key,
    required String lessonId,
    required List<String> clipUrls,
    required _i28.LessonModel lesson,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         LessonRoute.name,
         args: LessonRouteArgs(
           key: key,
           lessonId: lessonId,
           clipUrls: clipUrls,
           lesson: lesson,
         ),
         initialChildren: children,
       );

  static const String name = 'LessonRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonRouteArgs>();
      return _i10.LessonPage(
        key: args.key,
        lessonId: args.lessonId,
        clipUrls: args.clipUrls,
        lesson: args.lesson,
      );
    },
  );
}

class LessonRouteArgs {
  const LessonRouteArgs({
    this.key,
    required this.lessonId,
    required this.clipUrls,
    required this.lesson,
  });

  final _i26.Key? key;

  final String lessonId;

  final List<String> clipUrls;

  final _i28.LessonModel lesson;

  @override
  String toString() {
    return 'LessonRouteArgs{key: $key, lessonId: $lessonId, clipUrls: $clipUrls, lesson: $lesson}';
  }
}

/// generated route for
/// [_i11.LessonsByLevelPage]
class LessonsByLevelRoute extends _i25.PageRouteInfo<LessonsByLevelRouteArgs> {
  LessonsByLevelRoute({
    _i26.Key? key,
    required _i27.CategoryLevel categoryLevel,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         LessonsByLevelRoute.name,
         args: LessonsByLevelRouteArgs(key: key, categoryLevel: categoryLevel),
         initialChildren: children,
       );

  static const String name = 'LessonsByLevelRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonsByLevelRouteArgs>();
      return _i11.LessonsByLevelPage(
        key: args.key,
        categoryLevel: args.categoryLevel,
      );
    },
  );
}

class LessonsByLevelRouteArgs {
  const LessonsByLevelRouteArgs({this.key, required this.categoryLevel});

  final _i26.Key? key;

  final _i27.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonsByLevelRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i12.LoginView]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginView();
    },
  );
}

/// generated route for
/// [_i13.NoConnectionView]
class NoConnectionRoute extends _i25.PageRouteInfo<void> {
  const NoConnectionRoute({List<_i25.PageRouteInfo>? children})
    : super(NoConnectionRoute.name, initialChildren: children);

  static const String name = 'NoConnectionRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i13.NoConnectionView();
    },
  );
}

/// generated route for
/// [_i14.OnboardingScreen]
class OnboardingRoute extends _i25.PageRouteInfo<void> {
  const OnboardingRoute({List<_i25.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i14.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i15.ProfileEditView]
class ProfileEditRoute extends _i25.PageRouteInfo<void> {
  const ProfileEditRoute({List<_i25.PageRouteInfo>? children})
    : super(ProfileEditRoute.name, initialChildren: children);

  static const String name = 'ProfileEditRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i15.ProfileEditView();
    },
  );
}

/// generated route for
/// [_i16.ProfileView]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute({List<_i25.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProfileView();
    },
  );
}

/// generated route for
/// [_i17.QuizDetailView]
class QuizDetailRoute extends _i25.PageRouteInfo<QuizDetailRouteArgs> {
  QuizDetailRoute({
    _i26.Key? key,
    required String levelId,
    required String unitId,
    required String lessonId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         QuizDetailRoute.name,
         args: QuizDetailRouteArgs(
           key: key,
           levelId: levelId,
           unitId: unitId,
           lessonId: lessonId,
         ),
         initialChildren: children,
       );

  static const String name = 'QuizDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizDetailRouteArgs>();
      return _i17.QuizDetailView(
        key: args.key,
        levelId: args.levelId,
        unitId: args.unitId,
        lessonId: args.lessonId,
      );
    },
  );
}

class QuizDetailRouteArgs {
  const QuizDetailRouteArgs({
    this.key,
    required this.levelId,
    required this.unitId,
    required this.lessonId,
  });

  final _i26.Key? key;

  final String levelId;

  final String unitId;

  final String lessonId;

  @override
  String toString() {
    return 'QuizDetailRouteArgs{key: $key, levelId: $levelId, unitId: $unitId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i18.QuizScoreView]
class QuizScoreRoute extends _i25.PageRouteInfo<QuizScoreRouteArgs> {
  QuizScoreRoute({
    _i26.Key? key,
    required String levelId,
    required String unitId,
    required String lessonId,
    required String quizTitle,
    required int totalQuestions,
    required int correctAnswers,
    required int incorrectAnswers,
    required int skippedQuestions,
    required List<_i18.QuizQuestionResult> questionResults,
    required Duration timeTaken,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         QuizScoreRoute.name,
         args: QuizScoreRouteArgs(
           key: key,
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
         initialChildren: children,
       );

  static const String name = 'QuizScoreRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizScoreRouteArgs>();
      return _i18.QuizScoreView(
        key: args.key,
        levelId: args.levelId,
        unitId: args.unitId,
        lessonId: args.lessonId,
        quizTitle: args.quizTitle,
        totalQuestions: args.totalQuestions,
        correctAnswers: args.correctAnswers,
        incorrectAnswers: args.incorrectAnswers,
        skippedQuestions: args.skippedQuestions,
        questionResults: args.questionResults,
        timeTaken: args.timeTaken,
      );
    },
  );
}

class QuizScoreRouteArgs {
  const QuizScoreRouteArgs({
    this.key,
    required this.levelId,
    required this.unitId,
    required this.lessonId,
    required this.quizTitle,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.skippedQuestions,
    required this.questionResults,
    required this.timeTaken,
  });

  final _i26.Key? key;

  final String levelId;

  final String unitId;

  final String lessonId;

  final String quizTitle;

  final int totalQuestions;

  final int correctAnswers;

  final int incorrectAnswers;

  final int skippedQuestions;

  final List<_i18.QuizQuestionResult> questionResults;

  final Duration timeTaken;

  @override
  String toString() {
    return 'QuizScoreRouteArgs{key: $key, levelId: $levelId, unitId: $unitId, lessonId: $lessonId, quizTitle: $quizTitle, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, incorrectAnswers: $incorrectAnswers, skippedQuestions: $skippedQuestions, questionResults: $questionResults, timeTaken: $timeTaken}';
  }
}

/// generated route for
/// [_i19.QuizViewWithMultiChoice]
class QuizRouteWithMultiChoice
    extends _i25.PageRouteInfo<QuizRouteWithMultiChoiceArgs> {
  QuizRouteWithMultiChoice({
    _i26.Key? key,
    required String levelId,
    required String unitId,
    required String lessonId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         QuizRouteWithMultiChoice.name,
         args: QuizRouteWithMultiChoiceArgs(
           key: key,
           levelId: levelId,
           unitId: unitId,
           lessonId: lessonId,
         ),
         initialChildren: children,
       );

  static const String name = 'QuizRouteWithMultiChoice';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteWithMultiChoiceArgs>();
      return _i19.QuizViewWithMultiChoice(
        key: args.key,
        levelId: args.levelId,
        unitId: args.unitId,
        lessonId: args.lessonId,
      );
    },
  );
}

class QuizRouteWithMultiChoiceArgs {
  const QuizRouteWithMultiChoiceArgs({
    this.key,
    required this.levelId,
    required this.unitId,
    required this.lessonId,
  });

  final _i26.Key? key;

  final String levelId;

  final String unitId;

  final String lessonId;

  @override
  String toString() {
    return 'QuizRouteWithMultiChoiceArgs{key: $key, levelId: $levelId, unitId: $unitId, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i20.SecondLessonDetailScreen]
class SecondLessonDetailRoute
    extends _i25.PageRouteInfo<SecondLessonDetailRouteArgs> {
  SecondLessonDetailRoute({
    _i26.Key? key,
    required _i29.LevelDetails details,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         SecondLessonDetailRoute.name,
         args: SecondLessonDetailRouteArgs(key: key, details: details),
         initialChildren: children,
       );

  static const String name = 'SecondLessonDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SecondLessonDetailRouteArgs>();
      return _i20.SecondLessonDetailScreen(
        key: args.key,
        details: args.details,
      );
    },
  );
}

class SecondLessonDetailRouteArgs {
  const SecondLessonDetailRouteArgs({this.key, required this.details});

  final _i26.Key? key;

  final _i29.LevelDetails details;

  @override
  String toString() {
    return 'SecondLessonDetailRouteArgs{key: $key, details: $details}';
  }
}

/// generated route for
/// [_i21.SettingsView]
class SettingsRoute extends _i25.PageRouteInfo<void> {
  const SettingsRoute({List<_i25.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i21.SettingsView();
    },
  );
}

/// generated route for
/// [_i14.SignIntroView]
class SignIntroRoute extends _i25.PageRouteInfo<void> {
  const SignIntroRoute({List<_i25.PageRouteInfo>? children})
    : super(SignIntroRoute.name, initialChildren: children);

  static const String name = 'SignIntroRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i14.SignIntroView();
    },
  );
}

/// generated route for
/// [_i22.SignSplashScreen]
class SignSplashRoute extends _i25.PageRouteInfo<void> {
  const SignSplashRoute({List<_i25.PageRouteInfo>? children})
    : super(SignSplashRoute.name, initialChildren: children);

  static const String name = 'SignSplashRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i22.SignSplashScreen();
    },
  );
}

/// generated route for
/// [_i23.SignupView]
class SignupRoute extends _i25.PageRouteInfo<void> {
  const SignupRoute({List<_i25.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i23.SignupView();
    },
  );
}

/// generated route for
/// [_i24.SkeletonTabView]
class SkeletonTabRoute extends _i25.PageRouteInfo<void> {
  const SkeletonTabRoute({List<_i25.PageRouteInfo>? children})
    : super(SkeletonTabRoute.name, initialChildren: children);

  static const String name = 'SkeletonTabRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i24.SkeletonTabView();
    },
  );
}
