import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_launcher.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/contact_info.dart';
import 'social_bar.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key, required this.contact});

  final ContactInfo contact;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _message.dispose();
    super.dispose();
  }

  Future<void> _send() => AppLauncher.sendEmail(
        to: widget.contact.email,
        subject: 'Portfolio enquiry from ${_name.text}',
        body: 'Name: ${_name.text}\nEmail: ${_email.text}\n\n${_message.text}',
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      delay: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            badge: AppStrings.badgeContact,
            title: AppStrings.sectionContact,
            subtitle: AppStrings.contactLead,
          ),
          const SizedBox(height: 48),
          // ── Contact glass panel ─────────────────────────────
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.border),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 60,
                  offset: const Offset(0, 16),
                ),
                const BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 40,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 760;
                final details = _contactDetails(context);
                final form = _contactForm(context);
                if (isNarrow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [details, const SizedBox(height: 32), form],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: details),
                    const SizedBox(width: 40),
                    Expanded(flex: 6, child: form),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Email ───────────────────────────────────────────
        _ContactRow(
          icon: Icons.mail_outline_rounded,
          label: widget.contact.email,
          color: AppColors.primary,
          onTap: () => AppLauncher.sendEmail(
            to: widget.contact.email,
            subject: 'Hello from your portfolio',
            body: '',
          ),
        ),
        const SizedBox(height: 14),
        // ── Phone ───────────────────────────────────────────
        _ContactRow(
          icon: Icons.phone_outlined,
          label: widget.contact.phone,
          color: AppColors.accent,
          onTap: () => AppLauncher.call(widget.contact.phone),
        ),
        const SizedBox(height: 14),
        // ── Location ────────────────────────────────────────
        _ContactRow(
          icon: Icons.location_on_outlined,
          label: widget.contact.location,
          color: AppColors.success,
        ),
        const SizedBox(height: 24),
        // ── Action buttons ──────────────────────────────────
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            CustomButton(
              label: AppStrings.callNow,
              icon: Icons.call_outlined,
              gradient: true,
              onPressed: () => AppLauncher.call(widget.contact.phone),
            ),
            CustomButton(
              label: AppStrings.whatsapp,
              icon: Icons.chat_bubble_outline_rounded,
              outlined: true,
              onPressed: () => AppLauncher.whatsapp(widget.contact.phone),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // ── Social ──────────────────────────────────────────
        SocialBar(links: widget.contact.socialLinks),
      ],
    );
  }

  Widget _contactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send a message',
          style: AppTextStyles.title.copyWith(fontSize: 17),
        ),
        const SizedBox(height: 20),
        CustomTextField(controller: _name, hint: AppStrings.nameHint),
        const SizedBox(height: 12),
        CustomTextField(controller: _email, hint: AppStrings.emailHint),
        const SizedBox(height: 12),
        CustomTextField(
          controller: _message,
          hint: AppStrings.messageHint,
          maxLines: 5,
        ),
        const SizedBox(height: 16),
        CustomButton(
          label: AppStrings.sendEmail,
          icon: Icons.send_rounded,
          gradient: true,
          onPressed: _send,
        ),
      ],
    );
  }
}

class _ContactRow extends StatefulWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  State<_ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<_ContactRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(widget.icon, color: widget.color, size: 17),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                widget.label,
                style: AppTextStyles.bodySmall.copyWith(
                  color: _hovered && widget.onTap != null
                      ? widget.color
                      : AppColors.ink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
