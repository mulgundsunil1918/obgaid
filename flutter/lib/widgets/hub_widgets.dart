import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Standard hub page: title, optional intro, and its tiles laid out as boxes.
///
/// Callers pass a flat list mixing section headers with [HubTile]s. Rather
/// than making every hub build its own grid, consecutive runs of tiles are
/// collected and laid out together, and anything else spans the full width.
/// That keeps the fourteen hubs unchanged while the layout lives in one place.
///
/// A search field appears once a hub holds more than eight tiles — below that
/// the list is shorter than the search box is useful.
class HubScaffold extends StatefulWidget {
  const HubScaffold({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.intro,
    this.searchHint,
  });

  final String title;
  final String? subtitle;
  final String? intro;
  final List<Widget> children;

  /// Overrides the generated hint. Say what is being searched and how much of
  /// it — a bare 'Search…' hides the size of the list.
  final String? searchHint;

  @override
  State<HubScaffold> createState() => _HubScaffoldState();
}

class _HubScaffoldState extends State<HubScaffold> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  int get _tileCount => widget.children.whereType<HubTile>().length;

  /// Group consecutive tiles into a grid; pass everything else through.
  List<Widget> _layout(BuildContext context, List<Widget> children) {
    final w = MediaQuery.of(context).size.width;
    final cols = w < 600 ? 2 : (w < 980 ? 3 : 4);
    final out = <Widget>[];
    var run = <HubTile>[];

    void flush() {
      if (run.isEmpty) return;
      final tiles = List<HubTile>.from(run);
      out.add(GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: w < 600 ? 132 : 142,
        ),
        itemCount: tiles.length,
        itemBuilder: (_, i) => tiles[i],
      ));
      out.add(const SizedBox(height: 18));
      run = [];
    }

    for (final c in children) {
      if (c is HubTile) {
        run.add(c);
      } else {
        flush();
        out.add(c);
      }
    }
    flush();
    return out;
  }

  /// Filtering drops the section headers too, because a header above an empty
  /// grid reads as a broken screen.
  List<Widget> _filtered() {
    if (_query.trim().isEmpty) return widget.children;
    final q = _query.trim().toLowerCase();
    return widget.children
        .whereType<HubTile>()
        .where((t) =>
            t.title.toLowerCase().contains(q) ||
            t.subtitle.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final shown = _filtered();
    final showSearch = _tileCount > 8;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.title),
            if (widget.subtitle != null)
              Text(widget.subtitle!,
                  style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        children: [
          if (widget.intro != null && _query.isEmpty) ...[
            Text(widget.intro!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(height: 1.5)),
            const SizedBox(height: 16),
          ],
          if (showSearch) ...[
            HubSearchField(
              controller: _search,
              hintText:
                  widget.searchHint ?? 'Search $_tileCount in ${widget.title}…',
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 14),
          ],
          if (shown.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(children: [
                Icon(Icons.search_off,
                    size: 34, color: cs.onSurface.withValues(alpha: 0.3)),
                const SizedBox(height: 10),
                Text('Nothing matches "$_query"',
                    style: TextStyle(
                        fontSize: 13.5,
                        color: cs.onSurface.withValues(alpha: 0.55))),
              ]),
            )
          else
            ..._layout(context, shown),
        ],
      ),
    );
  }
}

/// The one search box used by every hub. Themed from ColorScheme so it is
/// correct in light and dark without per-screen colour work.
class HubSearchField extends StatelessWidget {
  const HubSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final hasText = controller.text.isNotEmpty;

    OutlineInputBorder border(Color c, [double w = 1.0]) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: c, width: w),
        );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      style: TextStyle(fontSize: 14, color: cs.onSurface),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 13.5, color: cs.onSurface.withValues(alpha: 0.45)),
        prefixIcon:
            Icon(Icons.search, size: 20, color: cs.onSurface.withValues(alpha: 0.5)),
        suffixIcon: !hasText
            ? null
            : IconButton(
                icon: Icon(Icons.close,
                    size: 18, color: cs.onSurface.withValues(alpha: 0.55)),
                onPressed: () {
                  controller.clear();
                  onChanged('');
                },
              ),
        contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        enabledBorder: border(cs.outlineVariant),
        focusedBorder: border(cs.primary, 1.4),
        border: border(cs.outlineVariant),
      ),
    );
  }
}

/// One box in a hub grid. Icon block, title, subtitle — the same shape the
/// home screen uses, so moving from home into a module does not change the
/// visual language.
class HubTile extends StatelessWidget {
  const HubTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.badge,
    this.accent,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final String? badge;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tint = accent ?? cs.primary;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.dCard : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: isDark ? AppTheme.dBorder : const Color(0xFFD3E0DC)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: tint.withValues(alpha: isDark ? 0.22 : 0.12),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Icon(icon, size: 20, color: tint),
                  ),
                  const Spacer(),
                  if (badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: badge == 'India'
                            ? const Color(0xFFFF9933).withValues(alpha: 0.18)
                            : cs.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(badge!,
                          style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.3,
                              color: badge == 'India'
                                  ? const Color(0xFF9A5000)
                                  : cs.onSurfaceVariant)),
                    ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      color: cs.onSurface,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: GoogleFonts.plusJakartaSans(
                      color: cs.onSurface.withValues(alpha: 0.55),
                      fontSize: 10.5,
                      fontWeight: FontWeight.w500,
                      height: 1.25,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
