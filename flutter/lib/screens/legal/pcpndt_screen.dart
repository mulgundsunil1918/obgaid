import 'package:flutter/material.dart';
import 'legal_screen.dart';

class PcpndtScreen extends StatelessWidget {
  const PcpndtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LegalScreen(
      title: 'PCPNDT Act',
      act: 'Pre-Conception & Pre-Natal Diagnostic Techniques Act, 1994 (as amended 2003)',
      sources: [
        'The Pre-conception and Pre-natal Diagnostic Techniques (Prohibition of '
            'Sex Selection) Act, 1994, as amended in 2003.',
        'PCPNDT Rules, 1996 (as amended) — Form F is prescribed under Rule 9.',
        'Ministry of Health & Family Welfare, Government of India.',
      ],
      sections: [
        LegalSection('What the Act prohibits', [
          'Sex selection on a woman, a man, or on any tissue, embryo, '
              'conceptus, fluid or gamete derived from either or both of them — '
              'before or after conception.',
          'Communicating the sex of the foetus to the pregnant woman, her '
              'relatives, or any other person, by words, signs, or in any other '
              'manner.',
          'Advertising any facility for sex selection or prenatal sex '
              'determination.',
          'Conducting prenatal diagnostic techniques at any place not '
              'registered under the Act.',
        ], warn: true),
        LegalSection('Form F — the record that matters', [
          'Form F must be completed for EVERY prenatal diagnostic procedure, '
              'and completed BEFORE the procedure is conducted.',
          'It records the woman\'s particulars, the indication, the referring '
              'doctor, the declaration by the pregnant woman, and the '
              'declaration by the doctor conducting the procedure.',
          'The pregnant woman declares that she does not want to know the sex '
              'of her foetus; the practitioner declares that the sex has not '
              'been disclosed.',
          'Records must be preserved for a period of two years, or until '
              'disposal of any pending proceedings, whichever is later.',
          'An incomplete or incorrectly filled Form F is itself an offence '
              'under the Act — the commonest reason practitioners are '
              'prosecuted is clerical, not clinical.',
        ], warn: true),
        LegalSection('Section 4(3) — when a prenatal test may be done at all', [
          'Prenatal diagnostic techniques may be used only to detect: '
              'chromosomal abnormalities, genetic metabolic diseases, '
              'haemoglobinopathies, sex-linked genetic diseases, congenital '
              'anomalies, or any other abnormality notified by the Central '
              'Supervisory Board.',
          'And only where at least one of these applies: the woman is over 35; '
              'she has had two or more spontaneous abortions; she has been '
              'exposed to a potentially teratogenic agent (drugs, radiation, '
              'infection, chemicals); she or her partner has a family history '
              'of mental retardation or physical deformities; or any other '
              'condition specified by the Board.',
        ]),
        LegalSection('Registration and display', [
          'Genetic counselling centres, genetic laboratories, genetic clinics, '
              'ultrasound clinics and imaging centres must be registered under '
              'the Act.',
          'Every registered facility must prominently display a notice stating '
              'that disclosure of the sex of the foetus is prohibited under law.',
          'The registration certificate must be displayed at a conspicuous '
              'place at the facility.',
          'Machines may not be sold to, or used by, an unregistered facility.',
        ]),
        LegalSection('Penalties', [
          'For a medical practitioner — first offence: imprisonment up to three '
              'years and a fine up to ₹10,000. Subsequent offence: imprisonment '
              'up to five years and a fine up to ₹50,000.',
          'The name of a convicted practitioner is removed from the State '
              'Medical Council register for five years on a first conviction, '
              'and permanently on a subsequent one.',
          'For anyone seeking sex selection (other than the pregnant woman '
              'herself, who is presumed to have been compelled): imprisonment '
              'up to three years and a fine up to ₹50,000 for a first offence.',
          'Offences under the Act are cognizable, non-bailable and '
              'non-compoundable.',
        ], warn: true),
      ],
    );
  }
}
