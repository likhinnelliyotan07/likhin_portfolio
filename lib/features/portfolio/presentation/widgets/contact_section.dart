import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/app_launcher.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/gradient_panel.dart';
import '../../domain/entities/contact_info.dart';
import 'social_bar.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key, required this.contact});

  final ContactInfo contact;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> send() {
    final body =
        'Name: ${nameController.text}\nEmail: ${emailController.text}\n\n${messageController.text}';
    return AppLauncher.sendEmail(
      to: widget.contact.email,
      subject: 'Portfolio enquiry',
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      delay: 160,
      child: GradientPanel(
        colors: AppColors.contactGradient,
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.surface.withValues(alpha: .24)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 760;
              final details = contactDetails();
              final form = contactForm();
              if (isNarrow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [details, const SizedBox(height: 24), form],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: details),
                  const SizedBox(width: 26),
                  Expanded(flex: 5, child: form),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget contactDetails() {
    final lightBody = AppTextStyles.body.copyWith(color: AppColors.surface);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.sectionContact,
          style: AppTextStyles.sectionTitle.copyWith(color: AppColors.surface),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.contactLead,
          style: AppTextStyles.body.copyWith(color: AppColors.surface),
        ),
        const SizedBox(height: 18),
        Text(
          widget.contact.email,
          style: AppTextStyles.title.copyWith(color: AppColors.surface),
        ),
        const SizedBox(height: 8),
        Text(widget.contact.phone, style: lightBody),
        Text(widget.contact.location, style: lightBody),
        const SizedBox(height: 16),
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
              icon: Icons.chat_outlined,
              outlined: true,
              light: true,
              onPressed: () => AppLauncher.whatsapp(widget.contact.phone),
            ),
          ],
        ),
        const SizedBox(height: 18),
        SocialBar(links: widget.contact.socialLinks),
      ],
    );
  }

  Widget contactForm() {
    return Column(
      children: [
        CustomTextField(controller: nameController, hint: AppStrings.nameHint),
        const SizedBox(height: 12),
        CustomTextField(
          controller: emailController,
          hint: AppStrings.emailHint,
        ),
        const SizedBox(height: 12),
        CustomTextField(
          controller: messageController,
          hint: AppStrings.messageHint,
          maxLines: 5,
        ),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomButton(
            label: AppStrings.sendEmail,
            icon: Icons.send_outlined,
            onPressed: send,
          ),
        ),
      ],
    );
  }
}
