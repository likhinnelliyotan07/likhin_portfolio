import 'social_link.dart';

class ContactInfo {
  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    required this.socialLinks,
  });

  final String email;
  final String phone;
  final String location;
  final List<SocialLink> socialLinks;
}
