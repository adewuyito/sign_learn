/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/Icons/misc_icons
  $AssetsIconsMiscIconsGen get miscIcons => const $AssetsIconsMiscIconsGen();

  /// Directory path: assets/Icons/profile_icons
  $AssetsIconsProfileIconsGen get profileIcons =>
      const $AssetsIconsProfileIconsGen();

  /// Directory path: assets/Icons/social_icons
  $AssetsIconsSocialIconsGen get socialIcons =>
      const $AssetsIconsSocialIconsGen();
}

class $AssetsIconsMiscIconsGen {
  const $AssetsIconsMiscIconsGen();

  /// File path: assets/Icons/misc_icons/next_arrow.svg
  String get nextArrow => 'assets/Icons/misc_icons/next_arrow.svg';

  /// File path: assets/Icons/misc_icons/next_arrow_large.svg
  String get nextArrowLarge => 'assets/Icons/misc_icons/next_arrow_large.svg';

  /// File path: assets/Icons/misc_icons/reveal_Icon.svg
  String get revealIcon => 'assets/Icons/misc_icons/reveal_Icon.svg';

  /// File path: assets/Icons/misc_icons/tick_mark.svg
  String get tickMark => 'assets/Icons/misc_icons/tick_mark.svg';

  /// File path: assets/Icons/misc_icons/un_reveal_icon.svg
  String get unRevealIcon => 'assets/Icons/misc_icons/un_reveal_icon.svg';

  /// List of all assets
  List<String> get values => [
    nextArrow,
    nextArrowLarge,
    revealIcon,
    tickMark,
    unRevealIcon,
  ];
}

class $AssetsIconsProfileIconsGen {
  const $AssetsIconsProfileIconsGen();

  /// File path: assets/Icons/profile_icons/profile_account_info_icon.svg
  String get profileAccountInfoIcon =>
      'assets/Icons/profile_icons/profile_account_info_icon.svg';

  /// File path: assets/Icons/profile_icons/profile_help_icon.svg
  String get profileHelpIcon =>
      'assets/Icons/profile_icons/profile_help_icon.svg';

  /// File path: assets/Icons/profile_icons/profile_logout_icon.svg
  String get profileLogoutIcon =>
      'assets/Icons/profile_icons/profile_logout_icon.svg';

  /// File path: assets/Icons/profile_icons/profile_security_icon.svg
  String get profileSecurityIcon =>
      'assets/Icons/profile_icons/profile_security_icon.svg';

  /// List of all assets
  List<String> get values => [
    profileAccountInfoIcon,
    profileHelpIcon,
    profileLogoutIcon,
    profileSecurityIcon,
  ];
}

class $AssetsIconsSocialIconsGen {
  const $AssetsIconsSocialIconsGen();

  /// File path: assets/Icons/social_icons/facebook_plain.svg
  String get facebookPlain => 'assets/Icons/social_icons/facebook_plain.svg';

  /// File path: assets/Icons/social_icons/google_plain.svg
  String get googlePlain => 'assets/Icons/social_icons/google_plain.svg';

  /// List of all assets
  List<String> get values => [facebookPlain, googlePlain];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const AssetGenImage defaultProfile = AssetGenImage(
    'assets/default_profile.png',
  );

  /// List of all assets
  static List<AssetGenImage> get values => [defaultProfile];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
