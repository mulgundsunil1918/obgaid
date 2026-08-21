import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum Band { good, watch, alert, critical, neutral }

extension BandColor on Band {
  Color get color => switch (this) {
        Band.good => ObgColors.bandGood,
        Band.watch => ObgColors.bandWatch,
        Band.alert => ObgColors.bandAlert,
        Band.critical => ObgColors.bandCritical,
        Band.neutral => const Color(0xFF5B6B68),
      };
}

/// Shared page shell for every calculator: scrolling body, consistent padding,
/// bottom inset so the last field clears the keyboard.
class CalcScaffold extends StatelessWidget {
  const CalcScaffold({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            if (subtitle != null)
              Text(subtitle!,
                  style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70)),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
          children: children,
        ),
      ),
    );
  }
}

/// Headline result. One per screen, always the same shape, so the answer is
/// always in the same place on every calculator.
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.headline,
    this.band = Band.neutral,
    this.caption,
    this.rows = const [],
    this.note,
  });

  final String headline;
  final Band band;
  final String? caption;
  final List<(String, String)> rows;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: band.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: band.color.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(headline,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: band.color,
                      height: 1.2,
                    )),
                if (caption != null) ...[
                  const SizedBox(height: 6),
                  Text(caption!,
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(height: 1.4, fontWeight: FontWeight.w500)),
                ],
              ],
            ),
          ),
          if (rows.isNotEmpty) ...[
            Divider(color: band.color.withValues(alpha: 0.25), height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
              child: Column(
                children: rows
                    .map((r) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(r.$1,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                        color: theme
                                            .colorScheme.onSurfaceVariant)),
                              ),
                              Expanded(
                                flex: 6,
                                child: Text(r.$2,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
          if (note != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
              child: Text(note!,
                  style: theme.textTheme.bodySmall?.copyWith(
                      height: 1.4, color: theme.colorScheme.onSurfaceVariant)),
            ),
        ],
      ),
    );
  }
}

/// Labelled numeric field with a unit suffix.
class NumField extends StatelessWidget {
  const NumField({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
    this.unit,
    this.hint,
  });

  final String label;
  final String? unit;
  final String? hint;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixText: unit,
        ),
      ),
    );
  }
}

/// Section heading inside a calculator body.
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key, this.topPad = 22});
  final String text;
  final double topPad;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: topPad, bottom: 10),
      child: Text(text.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.7,
            color: theme.colorScheme.onSurfaceVariant,
          )),
    );
  }
}

/// A choice row used by the scored tools (Bishop, staging, etc).
class ScoreChoice<T> extends StatelessWidget {
  const ScoreChoice({
    super.key,
    required this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<(T, String)> options;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: options
                .map((o) => ChoiceChip(
                      label: Text(o.$2, style: const TextStyle(fontSize: 12.5)),
                      selected: value == o.$1,
                      onSelected: (_) => onChanged(o.$1),
                      showCheckmark: false,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
