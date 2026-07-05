import 'package:flutter/material.dart';

class SocialIcon {
  const SocialIcon._();

  static IconData fromLabel(String label) {
    return switch (label.toLowerCase()) {
      'github' => Icons.code,
      'linkedin' => Icons.business_center_outlined,
      'instagram' => Icons.photo_camera_outlined,
      'opentalent' => Icons.workspace_premium_outlined,
      _ => Icons.open_in_new,
    };
  }
}
