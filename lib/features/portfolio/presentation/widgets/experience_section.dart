import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/experience.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key, required this.experiences});

  final List<Experience> experiences;

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      delay: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            badge: AppStrings.badgeExperience,
            title: AppStrings.sectionExperience,
            subtitle: 'A decade of building products that scale — from embedded systems to AI-powered mobile platforms.',
          ),
          const SizedBox(height: 48),
          // ── Timeline ────────────────────────────────────────
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Vertical line
                const _TimelineLine(),
                const SizedBox(width: 0),
                // Cards
                Expanded(
                  child: Column(
                    children: [
                      for (int i = 0; i < experiences.length; i++)
                        ExperienceCard(
                          experience: experiences[i],
                          isLast: i == experiences.length - 1,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineLine extends StatelessWidget {
  const _TimelineLine();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      child: CustomPaint(painter: _LinePainter()),
    );
  }
}

class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3D3D55)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(size.width / 2, 16),
      Offset(size.width / 2, size.height - 16),
      paint,
    );
  }

  @override
  bool shouldRepaint(_LinePainter old) => false;
}
