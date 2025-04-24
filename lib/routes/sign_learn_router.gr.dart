// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:sign_learn/features/auth/presentation/views/login_view.dart'
    as _i6;
import 'package:sign_learn/features/auth/presentation/views/signup_view.dart'
    as _i9;
import 'package:sign_learn/features/dictionary/presentation/dictionary_entry_detail_view.dart'
    as _i1;
import 'package:sign_learn/features/dictionary/presentation/dictionary_view.dart'
    as _i2;
import 'package:sign_learn/features/home/presentation/home_view.dart' as _i3;
import 'package:sign_learn/features/lessons/data/data.dart' as _i13;
import 'package:sign_learn/features/lessons/presentation/lesson_detail_screen.dart'
    as _i4;
import 'package:sign_learn/features/lessons/presentation/lesson_list_view.dart'
    as _i5;
import 'package:sign_learn/features/profile/presentation/profile_view.dart'
    as _i7;
import 'package:sign_learn/features/settings/presentation/settings_view.dart'
    as _i8;
import 'package:sign_learn/features/skeleton_view.dart' as _i10;

/// generated route for
/// [_i1.DictionaryEntryDetailView]
class DictionaryEntryDetailRoute
    extends _i11.PageRouteInfo<DictionaryEntryDetailRouteArgs> {
  DictionaryEntryDetailRoute({
    _i12.Key? key,
    String entryId = "1",
    List<_i11.PageRouteInfo>? children,
  }) : super(
         DictionaryEntryDetailRoute.name,
         args: DictionaryEntryDetailRouteArgs(key: key, entryId: entryId),
         initialChildren: children,
       );

  static const String name = 'DictionaryEntryDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DictionaryEntryDetailRouteArgs>(
        orElse: () => const DictionaryEntryDetailRouteArgs(),
      );
      return _i1.DictionaryEntryDetailView(
        key: args.key,
        entryId: args.entryId,
      );
    },
  );
}

class DictionaryEntryDetailRouteArgs {
  const DictionaryEntryDetailRouteArgs({this.key, this.entryId = "1"});

  final _i12.Key? key;

  final String entryId;

  @override
  String toString() {
    return 'DictionaryEntryDetailRouteArgs{key: $key, entryId: $entryId}';
  }
}

/// generated route for
/// [_i2.DictionaryView]
class DictionaryRoute extends _i11.PageRouteInfo<void> {
  const DictionaryRoute({List<_i11.PageRouteInfo>? children})
    : super(DictionaryRoute.name, initialChildren: children);

  static const String name = 'DictionaryRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.DictionaryView();
    },
  );
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeView();
    },
  );
}

/// generated route for
/// [_i4.LessonDetailScreen]
class LessonDetailRoute extends _i11.PageRouteInfo<LessonDetailRouteArgs> {
  LessonDetailRoute({
    _i12.Key? key,
    String lessonId = "1",
    List<_i11.PageRouteInfo>? children,
  }) : super(
         LessonDetailRoute.name,
         args: LessonDetailRouteArgs(key: key, lessonId: lessonId),
         initialChildren: children,
       );

  static const String name = 'LessonDetailRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonDetailRouteArgs>(
        orElse: () => const LessonDetailRouteArgs(),
      );
      return _i4.LessonDetailScreen(key: args.key, lessonId: args.lessonId);
    },
  );
}

class LessonDetailRouteArgs {
  const LessonDetailRouteArgs({this.key, this.lessonId = "1"});

  final _i12.Key? key;

  final String lessonId;

  @override
  String toString() {
    return 'LessonDetailRouteArgs{key: $key, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i5.LessonListScreen]
class LessonListRoute extends _i11.PageRouteInfo<LessonListRouteArgs> {
  LessonListRoute({
    _i12.Key? key,
    required _i13.CategoryLevel categoryLevel,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         LessonListRoute.name,
         args: LessonListRouteArgs(key: key, categoryLevel: categoryLevel),
         initialChildren: children,
       );

  static const String name = 'LessonListRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonListRouteArgs>();
      return _i5.LessonListScreen(
        key: args.key,
        categoryLevel: args.categoryLevel,
      );
    },
  );
}

class LessonListRouteArgs {
  const LessonListRouteArgs({this.key, required this.categoryLevel});

  final _i12.Key? key;

  final _i13.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonListRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i6.LoginView]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginView();
    },
  );
}

/// generated route for
/// [_i7.ProfileView]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileView();
    },
  );
}

/// generated route for
/// [_i8.SettingsView]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsView();
    },
  );
}

/// generated route for
/// [_i9.SignupView]
class SignupRoute extends _i11.PageRouteInfo<void> {
  const SignupRoute({List<_i11.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SignupView();
    },
  );
}

/// generated route for
/// [_i10.SkeletonTabView]
class SkeletonTabRoute extends _i11.PageRouteInfo<void> {
  const SkeletonTabRoute({List<_i11.PageRouteInfo>? children})
    : super(SkeletonTabRoute.name, initialChildren: children);

  static const String name = 'SkeletonTabRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SkeletonTabView();
    },
  );
}
