import 'package:flutter/material.dart';
import '../../data/tool_registry.dart';
import '../../data/staging_data.dart';
import '../../data/algorithm_registry.dart';
import '../../data/topic_registry.dart';
import '../topics/topic_screen.dart';
import '../algorithms/algorithm_screen.dart';
import '../../models/tool.dart';
import '../staging/staging_screen.dart';

/// Global search across working tools and staging systems.
class AppSearchDelegate extends SearchDelegate<void> {
  @override
  String get searchFieldLabel => 'Search tools and staging';

  @override
  List<Widget> buildActions(BuildContext context) => [
        if (query.isNotEmpty)
          IconButton(
              icon: const Icon(Icons.clear), onPressed: () => query = ''),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => _results(context);

  @override
  Widget buildSuggestions(BuildContext context) => _results(context);

  Widget _results(BuildContext context) {
    final tools = ToolRegistry.search(query);
    final algos = AlgorithmRegistry.search(query);
    final topics = TopicRegistry.search(query);
    final needle = query.trim().toLowerCase();
    final systems = needle.isEmpty
        ? kStagingSystems
        : kStagingSystems
            .where((s) =>
                s.name.toLowerCase().contains(needle) ||
                s.edition.toLowerCase().contains(needle))
            .toList();

    if (tools.isEmpty && systems.isEmpty && algos.isEmpty && topics.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text('Nothing matches "$query" yet.\n\n'
              'Most of the library arrives in Phases 2–5 — see the roadmap.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      );
    }

    return ListView(
      children: [
        if (algos.isNotEmpty)
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
            child: Text('EMERGENCY ALGORITHMS',
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8,
                    color: Color(0xFFB3261E))),
          ),
        ...algos.map((a) => ListTile(
              leading: const Icon(Icons.emergency_outlined,
                  color: Color(0xFFB3261E)),
              title: Text(a.name),
              subtitle: Text(a.subtitle, maxLines: 2),
              onTap: () {
                close(context, null);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AlgorithmScreen(algorithm: a)));
              },
            )),
        if (tools.isNotEmpty)
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 18, 16, 6),
            child: Text('TOOLS',
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8)),
          ),
        ...tools.map((t) => ListTile(
              leading: Icon(t.module.icon),
              title: Text(t.name),
              subtitle: Text(t.blurb, maxLines: 2),
              onTap: () {
                close(context, null);
                Navigator.push(
                    context, MaterialPageRoute(builder: t.builder));
              },
            )),
        if (topics.isNotEmpty)
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 18, 16, 6),
            child: Text('CLINICAL TOPICS',
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8)),
          ),
        ...topics.map((t) => ListTile(
              leading: const Icon(Icons.article_outlined),
              title: Text(t.name),
              subtitle: Text(t.subtitle, maxLines: 2),
              onTap: () {
                close(context, null);
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TopicScreen(topic: t)));
              },
            )),
        if (systems.isNotEmpty)
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 18, 16, 6),
            child: Text('STAGING',
                style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.8)),
          ),
        ...systems.map((s) => ListTile(
              leading: const Icon(Icons.biotech_outlined),
              title: Text(s.name),
              subtitle: Text(s.edition),
              onTap: () {
                close(context, null);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => StagingScreen(system: s)));
              },
            )),
      ],
    );
  }
}
