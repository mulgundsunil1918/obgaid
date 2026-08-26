import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../data/icon_map.dart';

/// Renders a node's icon: a Health Icons glyph where one exists for the
/// subject, otherwise the Material icon.
///
/// Material has no uterus, no fetus, no speculum and no IUD, so the
/// domain-specific half of the vocabulary comes from healthicons.org — CC0,
/// drawn for health programmes, and authored with fill="currentColor" so it
/// tints exactly like a Material icon.
class ObgIcon extends StatelessWidget {
  const ObgIcon({
    super.key,
    required this.id,
    required this.fallback,
    this.size = 20,
    this.color,
  });

  /// Node id — the same key the icon map uses.
  final String id;

  /// Used when neither an SVG nor a mapped Material icon exists.
  final IconData fallback;

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? Theme.of(context).colorScheme.primary;
    final svg = IconMap.svgFor(id);

    if (svg != null) {
      return SvgPicture.asset(
        'assets/icons/$svg.svg',
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
        // A missing asset should degrade to the Material glyph rather than
        // showing a broken box on a clinical screen.
        placeholderBuilder: (_) =>
            Icon(IconMap.resolve(id, fallback), size: size, color: tint),
      );
    }
    return Icon(IconMap.resolve(id, fallback), size: size, color: tint);
  }
}
