// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:sign_learn/features/auth/presentation/auth_init_view.dart'
    as _i1;
import 'package:sign_learn/features/auth/presentation/views/login_view.dart'
    as _i8;
import 'package:sign_learn/features/auth/presentation/views/signup_view.dart'
    as _i14;
import 'package:sign_learn/features/dictionary/presentation/dictionary_entry_detail_view.dart'
    as _i2;
import 'package:sign_learn/features/dictionary/presentation/dictionary_view.dart'
    as _i4;
import 'package:sign_learn/features/dictionary/presentation/widgets/dictionary_widget.dart'
    as _i3;
import 'package:sign_learn/features/home/presentation/home_view.dart' as _i5;
import 'package:sign_learn/features/lessons/data/data.dart' as _i18;
import 'package:sign_learn/features/lessons/presentation/lesson_detail_screen.dart'
    as _i6;
import 'package:sign_learn/features/lessons/presentation/lesson_list_view.dart'
    as _i7;
import 'package:sign_learn/features/profile/presentation/profile_edit_view.dart'
    as _i9;
import 'package:sign_learn/features/profile/presentation/profile_view.dart'
    as _i10;
import 'package:sign_learn/features/settings/presentation/settings_view.dart'
    as _i11;
import 'package:sign_learn/features/sign_intro_view.dart' as _i12;
import 'package:sign_learn/features/skeleton_view.dart' as _i15;
import 'package:sign_learn/features/splash_view.dart' as _i13;

/// generated route for
/// [_i1.AuthInitPage]
class AuthInitRoute extends _i16.PageRouteInfo<void> {
  const AuthInitRoute({List<_i16.PageRouteInfo>? children})
    : super(AuthInitRoute.name, initialChildren: children);

  static const String name = 'AuthInitRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthInitPage();
    },
  );
}

/// generated route for
/// [_i2.DictionaryEntryDetailView]
class DictionaryEntryDetailRoute
    extends _i16.PageRouteInfo<DictionaryEntryDetailRouteArgs> {
  DictionaryEntryDetailRoute({
    required String videoId,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         DictionaryEntryDetailRoute.name,
         args: DictionaryEntryDetailRouteArgs(videoId: videoId, key: key),
         initialChildren: children,
       );

  static const String name = 'DictionaryEntryDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DictionaryEntryDetailRouteArgs>();
      return _i2.DictionaryEntryDetailView(args.videoId, key: args.key);
    },
  );
}

class DictionaryEntryDetailRouteArgs {
  const DictionaryEntryDetailRouteArgs({required this.videoId, this.key});

  final String videoId;

  final _i17.Key? key;

  @override
  String toString() {
    return 'DictionaryEntryDetailRouteArgs{videoId: $videoId, key: $key}';
  }
}

/// generated route for
/// [_i3.DictionaryEntryPage]
class DictionaryEntryRoute extends _i16.PageRouteInfo<void> {
  const DictionaryEntryRoute({List<_i16.PageRouteInfo>? children})
    : super(DictionaryEntryRoute.name, initialChildren: children);

  static const String name = 'DictionaryEntryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.DictionaryEntryPage();
    },
  );
}

/// generated route for
/// [_i4.DictionaryView]
class DictionaryRoute extends _i16.PageRouteInfo<void> {
  const DictionaryRoute({List<_i16.PageRouteInfo>? children})
    : super(DictionaryRoute.name, initialChildren: children);

  static const String name = 'DictionaryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.DictionaryView();
    },
  );
}

/// generated route for
/// [_i5.HomeView]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeView();
    },
  );
}

/// generated route for
/// [_i6.LessonDetailScreen]
class LessonDetailRoute extends _i16.PageRouteInfo<LessonDetailRouteArgs> {
  LessonDetailRoute({
    _i17.Key? key,
    String lessonId = "1",
    List<_i16.PageRouteInfo>? children,
  }) : super(
         LessonDetailRoute.name,
         args: LessonDetailRouteArgs(key: key, lessonId: lessonId),
         initialChildren: children,
       );

  static const String name = 'LessonDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonDetailRouteArgs>(
        orElse: () => const LessonDetailRouteArgs(),
      );
      return _i6.LessonDetailScreen(key: args.key, lessonId: args.lessonId);
    },
  );
}

class LessonDetailRouteArgs {
  const LessonDetailRouteArgs({this.key, this.lessonId = "1"});

  final _i17.Key? key;

  final String lessonId;

  @override
  String toString() {
    return 'LessonDetailRouteArgs{key: $key, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i7.LessonListScreen]
class LessonListRoute extends _i16.PageRouteInfo<LessonListRouteArgs> {
  LessonListRoute({
    _i17.Key? key,
    required _i18.CategoryLevel categoryLevel,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         LessonListRoute.name,
         args: LessonListRouteArgs(key: key, categoryLevel: categoryLevel),
         initialChildren: children,
       );

  static const String name = 'LessonListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
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

  final _i17.Key? key;

  final _i18.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonListRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i8.LoginView]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginView();
    },
  );
}

/// generated route for
/// [_i9.ProfileEditView]
class ProfileEditRoute extends _i16.PageRouteInfo<void> {
  const ProfileEditRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileEditRoute.name, initialChildren: children);

  static const String name = 'ProfileEditRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileEditView();
    },
  );
}

/// generated route for
/// [_i10.ProfileView]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileView();
    },
  );
}

/// generated route for
/// [_i11.SettingsView]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsView();
    },
  );
}

/// generated route for
/// [_i12.SignIntroView]
class SignIntroRoute extends _i16.PageRouteInfo<void> {
  const SignIntroRoute({List<_i16.PageRouteInfo>? children})
    : super(SignIntroRoute.name, initialChildren: children);

  static const String name = 'SignIntroRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.SignIntroView();
    },
  );
}

/// generated route for
/// [_i13.SignSplashScreen]
class SignSplashRoute extends _i16.PageRouteInfo<void> {
  const SignSplashRoute({List<_i16.PageRouteInfo>? children})
    : super(SignSplashRoute.name, initialChildren: children);

  static const String name = 'SignSplashRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SignSplashScreen();
    },
  );
}

/// generated route for
/// [_i14.SignupView]
class SignupRoute extends _i16.PageRouteInfo<void> {
  const SignupRoute({List<_i16.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.SignupView();
    },
  );
}

/// generated route for
/// [_i15.SkeletonTabView]
class SkeletonTabRoute extends _i16.PageRouteInfo<void> {
  const SkeletonTabRoute({List<_i16.PageRouteInfo>? children})
    : super(SkeletonTabRoute.name, initialChildren: children);

  static const String name = 'SkeletonTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.SkeletonTabView();
    },
  );
}
