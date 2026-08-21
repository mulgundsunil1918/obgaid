import 'package:flutter/material.dart';
import 'legal_screen.dart';

class MtpScreen extends StatelessWidget {
  const MtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      contentId: 'mtp-act',
      title: 'MTP Act',
      act: 'Medical Termination of Pregnancy (Amendment) Act, 2021',
      sources: [
        'The Medical Termination of Pregnancy (Amendment) Act, 2021 (No. 8 of '
            '2021) — in force from 24 September 2021.',
        'The Medical Termination of Pregnancy (Amendment) Rules, 2021 — Rule 3B '
            'lists the categories eligible for the 20–24 week window.',
        'Principal Act: Medical Termination of Pregnancy Act, 1971.',
      ],
      sections: [
        LegalSection('Gestational limits and who must agree', [
          'Up to 20 weeks — the opinion of ONE registered medical practitioner '
              'is sufficient.',
          '20 to 24 weeks — the opinion of TWO registered medical practitioners '
              'is required, and only for a woman falling within a category '
              'prescribed under Rule 3B.',
          'Beyond 24 weeks — permitted only on the approval of a State-level '
              'Medical Board, and only for substantial foetal abnormality.',
          'The gestational limits do not apply where termination is immediately '
              'necessary to save the life of the pregnant woman.',
        ]),
        LegalSection('Rule 3B — the seven categories for 20–24 weeks', [
          'Survivors of sexual assault, rape or incest.',
          'Minors.',
          'Change of marital status during an ongoing pregnancy (widowhood or '
              'divorce).',
          'Women with physical disabilities, as defined under the Rights of '
              'Persons with Disabilities Act, 2016.',
          'Mentally ill women, including intellectual disability.',
          'Foetal malformation carrying a substantial risk of being '
              'incompatible with life, or such that the child if born would be '
              'seriously handicapped.',
          'Women in humanitarian settings, disaster or emergency situations as '
              'declared by Government.',
        ]),
        LegalSection('Grounds for termination — Section 3(2)', [
          'Continuation would involve a risk to the life of the pregnant woman.',
          'Continuation would cause grave injury to her physical or mental '
              'health.',
          'Substantial risk that the child, if born, would suffer serious '
              'physical or mental abnormality.',
          'Anguish caused by a pregnancy resulting from rape is presumed to '
              'constitute grave injury to mental health.',
          'Contraceptive failure — now extended to ANY woman and her partner. '
              'The 2021 amendment replaced the earlier wording limiting this to '
              'a married woman and her husband.',
        ]),
        LegalSection('Medical Board — beyond 24 weeks', [
          'Constituted by each State and Union Territory government.',
          'Members: a gynaecologist, a paediatrician, a radiologist or '
              'sonologist, and such other members as the State or UT government '
              'notifies.',
          'The Board examines the woman and her reports, and either allows or '
              'denies the termination with reasons.',
        ]),
        LegalSection('Confidentiality — Section 5A', [
          'The name and other particulars of a woman whose pregnancy has been '
              'terminated shall not be revealed, except to a person authorised '
              'by law.',
          'Contravention is punishable with imprisonment which may extend to '
              'one year, or a fine, or both.',
        ], warn: true),
        LegalSection('Where a termination may be performed', [
          'A hospital established or maintained by Government, or',
          'A place approved for the purpose by Government or by a District '
              'Level Committee constituted by Government.',
        ]),
        LegalSection('Consent', [
          'The consent of the pregnant woman alone is required.',
          'If she is a minor, or is mentally ill, the written consent of her '
              'guardian is required.',
          'Spousal consent is NOT required at any gestation.',
        ]),
      ],
    );
  }
}
