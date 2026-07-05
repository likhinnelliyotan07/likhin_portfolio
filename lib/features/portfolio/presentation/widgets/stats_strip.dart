import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import 'stat_tile.dart';

class StatsStrip extends StatelessWidget {
  const StatsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        StatTile(value: AppStrings.years, label: 'Years experience'),
        StatTile(value: '25+', label: AppStrings.apps),
        StatTile(value: '4', label: AppStrings.leadership),
        StatTile(value: '3', label: AppStrings.platforms),
      ],
    );
  }
}
