/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/NavWriteicon.png
  AssetGenImage get navWriteicon =>
      const AssetGenImage('assets/icons/NavWriteicon.png');

  /// File path: assets/icons/NavhomeIcon.png
  AssetGenImage get navhomeIcon =>
      const AssetGenImage('assets/icons/NavhomeIcon.png');

  /// File path: assets/icons/Navusericon.png
  AssetGenImage get navusericon =>
      const AssetGenImage('assets/icons/Navusericon.png');

  /// File path: assets/icons/mic_icon.png
  AssetGenImage get micIcon => const AssetGenImage('assets/icons/mic_icon.png');

  /// File path: assets/icons/pencil_icon.png
  AssetGenImage get pencilIcon =>
      const AssetGenImage('assets/icons/pencil_icon.png');

  /// File path: assets/icons/tag.png
  AssetGenImage get tag => const AssetGenImage('assets/icons/tag.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/Logo.png');

  /// File path: assets/images/Profile_avatar.png
  AssetGenImage get profileAvatar =>
      const AssetGenImage('assets/images/Profile_avatar.png');

  /// File path: assets/images/arrow.png
  AssetGenImage get arrow => const AssetGenImage('assets/images/arrow.png');

  /// File path: assets/images/programming.png
  AssetGenImage get programming =>
      const AssetGenImage('assets/images/programming.png');

  /// File path: assets/images/robot.svg
  String get robot => 'assets/images/robot.svg';
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  String get path => _assetName;

  String get keyName => _assetName;
}
