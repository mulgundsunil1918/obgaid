import 'package:flutter/material.dart';
import '../../widgets/hub_widgets.dart';

class CmeHub extends StatelessWidget {
  const CmeHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const HubScaffold(
      title: 'CME & Webinars',
      subtitle: 'Find & post events',
      intro: 'FOGSI societies run a great deal of teaching that never reaches '
          'the people who would attend it. Same module as PediAid, same '
          'backend, different audience.',
      children: [
        ComingSoon(phase: 'Phase 6', items: [
          'Browse upcoming CME programmes and webinars, filtered by city and date',
          'Post an event — with moderation before it goes live',
          'Credit hours and accrediting body',
          'Certificates for attended events',
          'Push notification when an event is posted near you',
          'Shares PediAid\'s CME backend, including the moderation queue',
        ]),
      ],
    );
  }
}
