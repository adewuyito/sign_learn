// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:sign_learn/features/auth/presentation/views/login_view.dart'
    as _i5;
import 'package:sign_learn/features/auth/presentation/views/signup_view.dart'
    as _i8;
import 'package:sign_learn/features/dictionary/presentation/dictionary_view.dart'
    as _i1;
import 'package:sign_learn/features/home/presentation/home_view.dart' as _i2;
import 'package:sign_learn/features/lessons/data/models/category_levels.dart'
    as _i12;
import 'package:sign_learn/features/lessons/presentation/widgets/lesson_detail_screen.dart'
    as _i3;
import 'package:sign_learn/features/lessons/presentation/widgets/lesson_list_view.dart'
    as _i4;
import 'package:sign_learn/features/profile/presentation/profile_view.dart'
    as _i6;
import 'package:sign_learn/features/settings/presentation/settings_view.dart'
    as _i7;
import 'package:sign_learn/features/skeleton_view.dart' as _i9;

/// generated route for
/// [_i1.DictionaryView]
class DictionaryRoute extends _i10.PageRouteInfo<void> {
  const DictionaryRoute({List<_i10.PageRouteInfo>? children})
      : super(DictionaryRoute.name, initialChildren: children);

  static const String name = 'DictionaryRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i1.DictionaryView();
    },
  );
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeView();
    },
  );
}

/// generated route for
/// [_i3.LessonDetailScreen]
class LessonDetailRoute extends _i10.PageRouteInfo<LessonDetailRouteArgs> {
  LessonDetailRoute({
    _i11.Key? key,
    required String lessonId,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LessonDetailRoute.name,
          args: LessonDetailRouteArgs(key: key, lessonId: lessonId),
          initialChildren: children,
        );

  static const String name = 'LessonDetailRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonDetailRouteArgs>();
      return _i3.LessonDetailScreen(key: args.key, lessonId: args.lessonId);
    },
  );
}

class LessonDetailRouteArgs {
  const LessonDetailRouteArgs({this.key, required this.lessonId});

  final _i11.Key? key;

  final String lessonId;

  @override
  String toString() {
    return 'LessonDetailRouteArgs{key: $key, lessonId: $lessonId}';
  }
}

/// generated route for
/// [_i4.LessonListScreen]
class LessonListRoute extends _i10.PageRouteInfo<LessonListRouteArgs> {
  LessonListRoute({
    _i11.Key? key,
    required _i12.CategoryLevel categoryLevel,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LessonListRoute.name,
          args: LessonListRouteArgs(key: key, categoryLevel: categoryLevel),
          initialChildren: children,
        );

  static const String name = 'LessonListRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonListRouteArgs>();
      return _i4.LessonListScreen(
        key: args.key,
        categoryLevel: args.categoryLevel,
      );
    },
  );
}

class LessonListRouteArgs {
  const LessonListRouteArgs({this.key, required this.categoryLevel});

  final _i11.Key? key;

  final _i12.CategoryLevel categoryLevel;

  @override
  String toString() {
    return 'LessonListRouteArgs{key: $key, categoryLevel: $categoryLevel}';
  }
}

/// generated route for
/// [_i5.LoginView]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginView();
    },
  );
}

/// generated route for
/// [_i6.ProfileView]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileView();
    },
  );
}

/// generated route for
/// [_i7.SettingsView]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsView();
    },
  );
}

/// generated route for
/// [_i8.SignupView]
class SignupRoute extends _i10.PageRouteInfo<void> {
  const SignupRoute({List<_i10.PageRouteInfo>? children})
      : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i8.SignupView();
    },
  );
}

/// generated route for
/// [_i9.SkeletonTabView]
class SkeletonTabRoute extends _i10.PageRouteInfo<void> {
  const SkeletonTabRoute({List<_i10.PageRouteInfo>? children})
      : super(SkeletonTabRoute.name, initialChildren: children);

  static const String name = 'SkeletonTabRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.SkeletonTabView();
    },
  );
}
