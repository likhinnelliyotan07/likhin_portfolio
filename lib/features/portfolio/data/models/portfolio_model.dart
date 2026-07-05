import '../../domain/entities/blog_article.dart';
import '../../domain/entities/contact_info.dart';
import '../../domain/entities/education.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/portfolio_profile.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_link.dart';
import '../../domain/entities/skill_group.dart';
import '../../domain/entities/social_link.dart';

class PortfolioModel extends PortfolioProfile {
  const PortfolioModel({
    required super.name,
    required super.role,
    required super.tagline,
    required super.summary,
    required super.contactInfo,
    required super.skillGroups,
    required super.experiences,
    required super.projects,
    required super.education,
    required super.certifications,
    required super.achievements,
    required super.blogs,
  });

  static const current = PortfolioModel(
    name: 'Likhin Nelliyotan',
    role: 'Technology Lead - Mobile Applications / Senior Flutter Developer',
    tagline: 'Flutter, native mobile, AI integration, and clean architecture.',
    summary:
        'Highly skilled mobile application developer with 9+ years of experience in Flutter, Kotlin, Swift, Java, and embedded systems. Proven delivery across hospitality, food delivery, AI collaboration, healthcare, 3D utilities, enterprise mobility, and CI/CD-enabled mobile platforms.',
    contactInfo: ContactInfo(
      email: 'lnelliyotan@gmail.com',
      phone: '+91 7356276206',
      location: 'Kannur, Kerala, India',
      socialLinks: [
        SocialLink(
          label: 'LinkedIn',
          url: 'https://in.linkedin.com/in/likhin-nelliyotan',
        ),
        SocialLink(
          label: 'GitHub',
          url: 'https://github.com/likhinnelliyotan07',
        ),
        SocialLink(
          label: 'OpenTalent',
          url: 'https://www.opentalent.in/likhin-nelliyotan',
        ),
        SocialLink(
          label: 'Instagram',
          url: 'https://www.instagram.com/likhin_lajitha/',
        ),
      ],
    ),
    skillGroups: [
      SkillGroup(
        title: 'Mobile',
        skills: [
          'Flutter',
          'Dart',
          'Kotlin',
          'Java',
          'Swift',
          'SwiftUI',
          'Flutter Web',
        ],
      ),
      SkillGroup(
        title: 'Architecture',
        skills: [
          'Clean Architecture',
          'BLoC',
          'MVVM',
          'GetX',
          'Provider',
          'Riverpod',
          'Repository Pattern',
        ],
      ),
      SkillGroup(
        title: 'Backend and Cloud',
        skills: [
          'REST APIs',
          'GraphQL',
          'Firebase',
          'AWS',
          'AWS Amplify',
          'Supabase',
          'Airtable',
        ],
      ),
      SkillGroup(
        title: 'Storage and Device',
        skills: [
          'Hive',
          'SQLite',
          'Room DB',
          'Secure Storage',
          'BLE',
          'MQTT',
          'Firebase Realtime Database',
        ],
      ),
      SkillGroup(
        title: 'AI and 3D',
        skills: [
          'Assembly AI',
          'ML Kit',
          'Core ML',
          'Cursor AI',
          'Three.js',
          'WebGL',
          'VTK',
        ],
      ),
      SkillGroup(
        title: 'Delivery',
        skills: [
          'Git',
          'GitHub Actions',
          'Jenkins',
          'Codemagic',
          'Jira',
          'Agile/Scrum',
          'FlutterFlow',
        ],
      ),
    ],
    experiences: [
      Experience(
        role: 'Senior Flutter Developer',
        company: 'Reelwise Entertainment Pvt Ltd',
        period: 'Feb 2026 - Present',
        location: 'Remote / Hybrid',
        points: [
          'Lead high-performance Flutter application development for scalable business ecosystems.',
          'Design BLoC and MVVM state layers with clean REST integrations.',
          'Coordinate with backend, QA, product, and design teams to stabilize production features.',
        ],
      ),
      Experience(
        role: 'Technology Lead - Mobility',
        company: 'Emvigo Technologies, Kochi',
        period: 'Mar 2022 - Feb 2026',
        location: 'Kochi, India',
        points: [
          'Mentored mobile developers and delivered Flutter, Kotlin, and Swift applications.',
          'Architected modular apps using Clean Architecture, MVVM, BLoC, GetX, and AI workflows.',
          'Built CI/CD release flows and integrated GraphQL, REST, Firebase, and AWS Amplify.',
        ],
      ),
      Experience(
        role: 'Senior Android Developer',
        company: 'Alisons Informatics Private Ltd',
        period: 'Sep 2020 - Mar 2022',
        location: 'Kannur, India',
        points: [
          'Built native Android and cross-platform Flutter modules using Kotlin, Java, and Flutter.',
          'Delivered secure BLE, IoT, Firebase authentication, cloud storage, and push notification features.',
          'Optimized Retrofit API layers, async queues, and local memory models.',
        ],
      ),
      Experience(
        role: 'Software Developer',
        company: 'Spectrographix',
        period: 'May 2016 - Sep 2020',
        location: 'Kannur, India',
        points: [
          'Developed Android apps using Java and Kotlin with clean release lifecycle management.',
          'Implemented interactive 3D and custom-view utilities with Three.js, WebGL, and VTK.',
          'Designed high-fidelity UI flows for native, web, and desktop utility products.',
        ],
      ),
      Experience(
        role: 'Embedded Developer',
        company: 'Inavade Technologies',
        period: 'Jul 2015 - May 2016',
        location: 'Kannur, India',
        points: [
          'Developed embedded logic with Embedded C and PIC compilers.',
          'Validated hardware-software integration for industrial automation systems.',
        ],
      ),
    ],
    projects: [
      Project(
        name: 'Reelwise',
        role: 'Senior Flutter Developer',
        summary:
            'AI-powered screenplay collaboration platform with production-grade Flutter architecture and REST integrations.',
        techStack: ['Flutter', 'BLoC', 'REST API', 'AI Workflows'],
        links: [
          ProjectLink(
            label: 'Live Web',
            url: 'https://prodtest.reelwise-staging.pages.dev/login',
          ),
        ],
      ),
      Project(
        name: 'Chicking UAE',
        role: 'Frontend Developer',
        summary:
            'High-traffic food-delivery storefront backed by GraphQL queries, AWS cloud infrastructure, BLoC, and Clean Architecture.',
        techStack: ['Flutter', 'GraphQL', 'AWS', 'Clean Architecture', 'BLoC'],
        links: [
          ProjectLink(
            label: 'Android',
            url:
                'https://play.google.com/store/apps/details?id=com.chickinguae&hl=en_IN',
          ),
          ProjectLink(
            label: 'iOS',
            url:
                'https://apps.apple.com/in/app/chicking-online-delivery/id1451570624',
          ),
        ],
      ),
      Project(
        name: 'I AM Qatar',
        role: 'Developer',
        summary:
            'Modular directory and localized content platform connected to high-volume REST backend feeds.',
        techStack: ['Flutter', 'REST API', 'Push Notifications'],
        links: [
          ProjectLink(
            label: 'Android',
            url:
                'https://play.google.com/store/apps/details?id=com.iamqatar.app&hl=en_IN',
          ),
          ProjectLink(
            label: 'iOS',
            url:
                'https://apps.apple.com/in/app/i-am-qatar-%D8%A5-%D8%A3%D9%85-%D9%82%D8%B7%D8%B1/id1279666434',
          ),
        ],
      ),
      Project(
        name: 'Staff by Inplass',
        role: 'Team Lead',
        summary:
            'B2B hospitality service platform with real-time staff-guest communication, Firebase, MVVM, and BLoC.',
        techStack: ['Flutter', 'Firebase', 'MVVM', 'BLoC'],
        links: [
          ProjectLink(
            label: 'Android',
            url:
                'https://play.google.com/store/apps/details?id=com.staff.inplass&hl=en_IN',
          ),
          ProjectLink(
            label: 'iOS',
            url: 'https://apps.apple.com/us/app/staff-by-inplass/id1625826703',
          ),
        ],
      ),
      Project(
        name: 'Rootes',
        role: 'Flutter Developer',
        summary:
            'Consumer commerce application developed with Flutter and production mobile release practices.',
        techStack: ['Flutter', 'Mobile Commerce', 'Release Management'],
        links: [
          ProjectLink(
            label: 'Android',
            url:
                'https://play.google.com/store/apps/details?id=com.rootecom.app&hl=en_IN',
          ),
        ],
      ),
      Project(
        name: 'Toxic Truth: Know Your Rights',
        role: 'Team Lead',
        summary:
            'AI-powered privacy protection utility for workplace interaction logs with real-time transcription and analysis.',
        techStack: ['Flutter', 'Firebase', 'Assembly AI', 'MVVM', 'BLoC'],
        links: [],
      ),
    ],
    education: [
      Education(
        degree: 'MBA in Information Technology Management',
        institute: 'DY Patil University',
        year: '2024',
        detail: 'GPA 8.3 / 10',
      ),
      Education(
        degree: 'B.Tech in Electronics and Communication Engineering',
        institute: 'Kannur University',
        year: '2015',
        detail: 'Score 67.62%',
      ),
    ],
    certifications: [
      'The Complete iOS 16 Developer with SwiftUI - Built over 10 production-ready apps',
      'PG Diploma in Embedded Systems',
      'Executive Decision-Making - LinkedIn Professional Learning',
      'Hands-on workshop on DSP and Embedded Systems',
    ],
    achievements: [
      '2nd Prize in Em Hack-2022 regional hackathon',
      'Zonal Round Winner at RoboTryst robotics competition',
    ],
    blogs: [
      BlogArticle(
        title: 'Clean Architecture for Long-Lived Flutter Products',
        category: 'Architecture',
        body:
            'A production Flutter app stays maintainable when entities, repositories, use cases, data sources, and UI widgets are allowed to change independently. This is the same separation I use for BLoC, MVVM, GraphQL, REST, and Firebase projects.',
      ),
      BlogArticle(
        title: 'Adding AI Features Without Weakening the Mobile Core',
        category: 'AI Integration',
        body:
            'Assembly AI, ML Kit, Core ML, and custom API models work best when the app isolates transcription, analysis, and permission logic behind stable domain contracts. The result is faster iteration without turning screens into service layers.',
      ),
      BlogArticle(
        title: 'Release Pipelines That Mobile Teams Actually Use',
        category: 'Delivery',
        body:
            'CI/CD is valuable when it reduces repeated release work, protects signing flows, and gives QA a predictable build path. GitHub Actions, Jenkins, and Codemagic can support that rhythm across Android, iOS, and Flutter Web.',
      ),
    ],
  );
}
