// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:sign_learn/common/commons.dart' as _i27;
import 'package:sign_learn/features/auth/presentation/auth_init_view.dart'
    as _i1;
import 'package:sign_learn/features/auth/presentation/views/login_view.dart'
    as _i11;
import 'package:sign_learn/features/auth/presentation/views/signup_view.dart'
    as _i22;
import 'package:sign_learn/features/dictionary/presentation/dictionary_entry_detail_view.dart'
    as _i2;
import 'package:sign_learn/features/dictionary/presentation/dictionary_view.dart'
    as _i4;
import 'package:sign_learn/features/dictionary/presentation/widgets/dictionary_widget.dart'
    as _i3;
import 'package:sign_learn/features/home/presentation/home_view.dart' as _i6;
import 'package:sign_learn/features/lessons/data/data.dart' as _i26;
import 'package:sign_learn/features/lessons/presentation/gpt_lesson_view.dart'
    as _i9;
import 'package:sign_learn/features/lessons/presentation/lesson_by_level_list.dart'
    as _i10;
import 'package:sign_learn/features/lessons/presentation/lesson_detail_screen.dart'
    as _i17;
import 'package:sign_learn/features/lessons/presentation/lesson_list_view.dart'
    as _i7;
import 'package:sign_learn/features/no_connection_view.dart' as _i12;
import 'package:sign_learn/features/profile/presentation/profile_edit_view.dart'
    as _i14;
import 'package:sign_learn/features/profile/presentation/profile_view.dart'
    as _i15;
import 'package:sign_learn/features/quiz/presentation/quiz_score_screen.dart'
    as _i16;
import 'package:sign_learn/features/quiz/presentation/sign_quiz_view.dart'
    as _i20;
import 'package:sign_learn/features/quiz/presentation/widgets/sign_quiz_option_view.dart'
    as _i19;
import 'package:sign_learn/features/settings/presentation/settings_view.dart'
    as _i18;
import 'package:sign_learn/features/shared/advanced_video_palyer_imp.dart'
    as _i8;
import 'package:sign_learn/features/shared/signlearn_upload_file.dart' as _i5;
import 'package:sign_learn/features/sign_intro_view.dart' as _i13;
import 'package:sign_learn/features/skeleton_view.dart' as _i23;
import 'package:sign_learn/features/splash_view.dart' as _i21;

/// generated route for
/// [_i1.AuthInitPage]
class AuthInitRoute extends _i24.PageRouteInfo<void> {
  const AuthInitRoute({List<_i24.PageRouteInfo>? children})
    : super(AuthInitRoute.name, initialChildren: children);

  static const String name = 'AuthInitRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthInitPage();
    },
  );
}

/// generated route for
/// [_i2.DictionaryEntryDetailView]
class DictionaryEntryDetailRoute
    extends _i24.PageRouteInfo<DictionaryEntryDetailRouteArgs> {
  DictionaryEntryDetailRoute({
    required String videoId,
    _i25.Key? key,
    required String youtubeUrl,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
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

  final _i25.Key? key;

  final String youtubeUrl;

  @override
  String toString() {
    return 'DictionaryEntryDetailRouteArgs{videoId: $videoId, key: $key, youtubeUrl: $youtubeUrl}';
  }
}

/// generated route for
/// [_i3.DictionaryEntryPage]
class DictionaryEntryRoute extends _i24.PageRouteInfo<void> {
  const DictionaryEntryRoute({List<_i24.PageRouteInfo>? children})
    : super(DictionaryEntryRoute.name, initialChildren: children);

  static const String name = 'DictionaryEntryRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i3.DictionaryEntryPage();
    },
  );
}

/// generated route for
/// [_i4.DictionaryView]
class DictionaryRoute extends _i24.PageRouteInfo<void> {
  const DictionaryRoute({List<_i24.PageRouteInfo>? children})
    : super(DictionaryRoute.name, initialChildren: children);

  static const String name = 'DictionaryRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i4.DictionaryView();
    },
  );
}

/// generated route for
/// [_i5.FirebaseFirestoreUpload]
class FirebaseFirestoreUpload extends _i24.PageRouteInfo<void> {
  const FirebaseFirestoreUpload({List<_i24.PageRouteInfo>? children})
    : super(FirebaseFirestoreUpload.name, initialChildren: children);

  static const String name = 'FirebaseFirestoreUpload';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i5.FirebaseFirestoreUpload();
    },
  );
}

/// generated route for
/// [_i6.HomeView]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeView();
    },
  );
}

/// generated route for
/// [_i7.LessonListScreen]
class LessonListRoute extends _i24.PageRouteInfo<LessonListRouteArgs> {
  LessonListRoute({
    _i25.Key? key,
    required _i26.CategoryLevel categoryLevel,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         LessonListRoute.name,
         args: LessonListRouteArgs(key: key, categoryLevel: categoryLevel),
         initialChildren: children,
       );

  static const String name = 'LessonListRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonListRouteArgs>();
      return _i7.LessonListScreen(
        key: args.key,
        categoryLevel: args.categoryLevel,
      );
    },
  );
}

class LessonListRouteArgs {
  const LessonListRouteArgs({this.key, required this.categoryLevel});

  final _i25.Key? key;

  final _i26.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonListRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i8.LessonListWidget]
class LessonListWidget extends _i24.PageRouteInfo<LessonListWidgetArgs> {
  LessonListWidget({
    _i25.Key? key,
    required String course,
    required String unit,
    required List<String> lessons,
    List<_i24.PageRouteInfo>? children,
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

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonListWidgetArgs>();
      return _i8.LessonListWidget(
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

  final _i25.Key? key;

  final String course;

  final String unit;

  final List<String> lessons;

  @override
  String toString() {
    return 'LessonListWidgetArgs{key: $key, course: $course, unit: $unit, lessons: $lessons}';
  }
}

/// generated route for
/// [_i9.LessonPage]
class LessonRoute extends _i24.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    _i25.Key? key,
    required String lessonId,
    required List<String> clipUrls,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         LessonRoute.name,
         args: LessonRouteArgs(
           key: key,
           lessonId: lessonId,
           clipUrls: clipUrls,
         ),
         initialChildren: children,
       );

  static const String name = 'LessonRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonRouteArgs>();
      return _i9.LessonPage(
        key: args.key,
        lessonId: args.lessonId,
        clipUrls: args.clipUrls,
      );
    },
  );
}

class LessonRouteArgs {
  const LessonRouteArgs({
    this.key,
    required this.lessonId,
    required this.clipUrls,
  });

  final _i25.Key? key;

  final String lessonId;

  final List<String> clipUrls;

  @override
  String toString() {
    return 'LessonRouteArgs{key: $key, lessonId: $lessonId, clipUrls: $clipUrls}';
  }
}

/// generated route for
/// [_i10.LessonsByLevelPage]
class LessonsByLevelRoute extends _i24.PageRouteInfo<LessonsByLevelRouteArgs> {
  LessonsByLevelRoute({
    _i25.Key? key,
    required _i26.CategoryLevel categoryLevel,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         LessonsByLevelRoute.name,
         args: LessonsByLevelRouteArgs(key: key, categoryLevel: categoryLevel),
         initialChildren: children,
       );

  static const String name = 'LessonsByLevelRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonsByLevelRouteArgs>();
      return _i10.LessonsByLevelPage(
        key: args.key,
        categoryLevel: args.categoryLevel,
      );
    },
  );
}

class LessonsByLevelRouteArgs {
  const LessonsByLevelRouteArgs({this.key, required this.categoryLevel});

  final _i25.Key? key;

  final _i26.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonsByLevelRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i11.LoginView]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute({List<_i24.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i11.LoginView();
    },
  );
}

/// generated route for
/// [_i12.NoConnectionView]
class NoConnectionRoute extends _i24.PageRouteInfo<void> {
  const NoConnectionRoute({List<_i24.PageRouteInfo>? children})
    : super(NoConnectionRoute.name, initialChildren: children);

  static const String name = 'NoConnectionRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i12.NoConnectionView();
    },
  );
}

/// generated route for
/// [_i13.OnboardingScreen]
class OnboardingRoute extends _i24.PageRouteInfo<void> {
  const OnboardingRoute({List<_i24.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i13.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i14.ProfileEditView]
class ProfileEditRoute extends _i24.PageRouteInfo<void> {
  const ProfileEditRoute({List<_i24.PageRouteInfo>? children})
    : super(ProfileEditRoute.name, initialChildren: children);

  static const String name = 'ProfileEditRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i14.ProfileEditView();
    },
  );
}

/// generated route for
/// [_i15.ProfileView]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute({List<_i24.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i15.ProfileView();
    },
  );
}

/// generated route for
/// [_i16.QuizScoreScreen]
class QuizScoreRoute extends _i24.PageRouteInfo<void> {
  const QuizScoreRoute({List<_i24.PageRouteInfo>? children})
    : super(QuizScoreRoute.name, initialChildren: children);

  static const String name = 'QuizScoreRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i16.QuizScoreScreen();
    },
  );
}

/// generated route for
/// [_i17.SecondLessonDetailScreen]
class SecondLessonDetailRoute
    extends _i24.PageRouteInfo<SecondLessonDetailRouteArgs> {
  SecondLessonDetailRoute({
    _i25.Key? key,
    required _i27.LevelDetails details,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         SecondLessonDetailRoute.name,
         args: SecondLessonDetailRouteArgs(key: key, details: details),
         initialChildren: children,
       );

  static const String name = 'SecondLessonDetailRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SecondLessonDetailRouteArgs>();
      return _i17.SecondLessonDetailScreen(
        key: args.key,
        details: args.details,
      );
    },
  );
}

class SecondLessonDetailRouteArgs {
  const SecondLessonDetailRouteArgs({this.key, required this.details});

  final _i25.Key? key;

  final _i27.LevelDetails details;

  @override
  String toString() {
    return 'SecondLessonDetailRouteArgs{key: $key, details: $details}';
  }
}

/// generated route for
/// [_i18.SettingsView]
class SettingsRoute extends _i24.PageRouteInfo<void> {
  const SettingsRoute({List<_i24.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i18.SettingsView();
    },
  );
}

/// generated route for
/// [_i13.SignIntroView]
class SignIntroRoute extends _i24.PageRouteInfo<void> {
  const SignIntroRoute({List<_i24.PageRouteInfo>? children})
    : super(SignIntroRoute.name, initialChildren: children);

  static const String name = 'SignIntroRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignIntroView();
    },
  );
}

/// generated route for
/// [_i19.SignQuizVideoOptionView]
class SignQuizVideoOptionRoute extends _i24.PageRouteInfo<void> {
  const SignQuizVideoOptionRoute({List<_i24.PageRouteInfo>? children})
    : super(SignQuizVideoOptionRoute.name, initialChildren: children);

  static const String name = 'SignQuizVideoOptionRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i19.SignQuizVideoOptionView();
    },
  );
}

/// generated route for
/// [_i20.SignQuizView]
class SignQuizRoute extends _i24.PageRouteInfo<void> {
  const SignQuizRoute({List<_i24.PageRouteInfo>? children})
    : super(SignQuizRoute.name, initialChildren: children);

  static const String name = 'SignQuizRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i20.SignQuizView();
    },
  );
}

/// generated route for
/// [_i21.SignSplashScreen]
class SignSplashRoute extends _i24.PageRouteInfo<void> {
  const SignSplashRoute({List<_i24.PageRouteInfo>? children})
    : super(SignSplashRoute.name, initialChildren: children);

  static const String name = 'SignSplashRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i21.SignSplashScreen();
    },
  );
}

/// generated route for
/// [_i22.SignupView]
class SignupRoute extends _i24.PageRouteInfo<void> {
  const SignupRoute({List<_i24.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i22.SignupView();
    },
  );
}

/// generated route for
/// [_i23.SkeletonTabView]
class SkeletonTabRoute extends _i24.PageRouteInfo<void> {
  const SkeletonTabRoute({List<_i24.PageRouteInfo>? children})
    : super(SkeletonTabRoute.name, initialChildren: children);

  static const String name = 'SkeletonTabRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i23.SkeletonTabView();
    },
  );
}
