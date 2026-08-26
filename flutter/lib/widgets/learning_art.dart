import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/learning_topic.dart';

/// The circular illustration for a learning curriculum area.
///
/// Two-tone on purpose: the linework is `currentColor`, resolved through
/// [SvgTheme] so it follows the app theme, while the clay accent is a literal
/// fill that survives in both light and dark. A `colorFilter` would flatten
/// both to one colour, which is why one is not used here.
class LearningArt extends StatelessWidget {
  const LearningArt({
    super.key,
    required this.category,
    this.size = 44,
    this.showCircle = true,
  });

  final LearningCategory category;
  final double size;
  final bool showCircle;

  static const _asset = <LearningCategory, String>{
    LearningCategory.basicSciences: 'basic-sciences',
    LearningCategory.historyExamination: 'history-examination',
    LearningCategory.earlyPregnancy: 'early-pregnancy',
    LearningCategory.antenatal: 'antenatal',
    LearningCategory.labourPuerperium: 'labour',
    LearningCategory.gynaecology: 'gynaecology',
    LearningCategory.sexualHealth: 'sexual-health',
    LearningCategory.reproductive: 'reproductive',
    LearningCategory.oncology: 'oncology',
  };

  /// Exposed so a test can prove every category has art and every asset is
  /// used.
  static Iterable<String> get assets => _asset.values;
  static String? assetFor(LearningCategory c) => _asset[c];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final name = _asset[category];
    if (name == null) {
      return Icon(Icons.menu_book_outlined, size: size * 0.6);
    }

    final art = SvgPicture.asset(
      'assets/learning/$name.svg',
      width: size * 0.62,
      height: size * 0.62,
      theme: SvgTheme(currentColor: cs.primary),
      placeholderBuilder: (_) => SizedBox(width: size * 0.62),
    );

    if (!showCircle) return art;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cs.primary.withValues(alpha: 0.09),
        shape: BoxShape.circle,
      ),
      child: art,
    );
  }
}
