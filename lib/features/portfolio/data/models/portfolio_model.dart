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
        businessProblem:
            'Screenwriters and film production teams lacked a unified, real-time collaboration platform capable of analyzing script context using AI, leading to fragmented workflows across multiple tools.',
        challenges: [
          'Synchronizing complex document states across multiple concurrent users with near-zero latency.',
          'Integrating heavy AI NLP models without blocking the main UI thread.',
          'Ensuring strict data consistency for collaborative editing on unstable network connections.',
        ],
        stateManagement:
            'BLoC (Business Logic Component) was utilized for strict unidirectional data flow, ensuring predictable state transitions during concurrent editing sessions.',
        backend:
            'Microservices architecture with Node.js and RESTful APIs, facilitating high-throughput concurrent connections.',
        database:
            'PostgreSQL for persistent relational data, combined with Redis for fast, ephemeral state caching during real-time collaboration.',
        authentication:
            'OAuth 2.0 with JWT-based session management, integrated with Role-Based Access Control (RBAC).',
        performanceOptimizations: [
          'Offloaded AI context analysis to background isolates to maintain 60fps UI rendering.',
          'Implemented optimistic UI updates for real-time typing, reducing perceived latency by 400ms.',
          'Used RepaintBoundary to isolate expensive rendering tasks in the document editor.',
        ],
        security:
            'End-to-end encryption for script data at rest and in transit. Strict input sanitization against XSS in collaborative rich-text fields.',
        testingStrategy:
            'Test-Driven Development (TDD) approach. 85% unit test coverage for BLoCs. Comprehensive integration tests for the collaboration synchronization engine using flutter_test.',
        scalability:
            'Stateless backend architecture containerized with Docker and orchestrated via Kubernetes, auto-scaling based on WebSocket connection metrics.',
        lessonsLearned: [
          'Handling conflict resolution on the client side (Operational Transformation) is significantly more complex than server-side authoritative state resolution.',
          'Isolates are mandatory for heavy JSON parsing of large script files.',
        ],
        businessImpact: [
          'Reduced average script finalization time by 30%.',
          'Successfully onboarded 10+ indie production houses within the first quarter.',
          'Achieved a 99.9% crash-free session rate.',
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
        businessProblem:
            'The existing mobile application could not handle high traffic during peak hours (weekends/holidays), resulting in lost orders, slow load times, and poor user retention.',
        challenges: [
          'Migrating a legacy monolithic architecture to a decoupled Clean Architecture without disrupting the live user base.',
          'Handling complex menu variations, add-ons, and dynamic pricing across different UAE regions.',
          'Optimizing image loading for thousands of menu items to reduce data usage and improve perceived performance.',
        ],
        stateManagement:
            'BLoC pattern layered over Clean Architecture, strictly separating UI from domain use cases and data repositories.',
        backend:
            'AWS serverless architecture using API Gateway and AWS Lambda, communicating via GraphQL for optimized data payload retrieval.',
        database:
            'Amazon DynamoDB for high-speed, scalable NoSQL data storage of menus and orders.',
        authentication:
            'AWS Cognito for secure, scalable user authentication and multi-factor verification.',
        performanceOptimizations: [
          'Implemented GraphQL data fetching to eliminate over-fetching, reducing API payload sizes by 60%.',
          'Integrated advanced image caching with customized eviction policies to minimize memory footprints.',
          'Utilized Flutter\'s sliver lists for hyper-efficient rendering of massive, deeply-nested menu categories.',
        ],
        security:
            'PCI-DSS compliant payment gateway integration. Tokenized storage for user payment methods.',
        testingStrategy:
            'Extensive mocking of GraphQL endpoints for isolated widget testing. End-to-end (E2E) UI testing using Flutter Driver for the critical checkout flow.',
        scalability:
            'AWS Lambda auto-scaling effortlessly handled 10x traffic spikes during promotional campaigns.',
        lessonsLearned: [
          'Properly structuring GraphQL schemas based on UI consumption patterns drastically improves client-side performance.',
          'Caching strategies must be carefully balanced to ensure users do not see stale pricing data.',
        ],
        businessImpact: [
          'Increased mobile order volume by 45% within three months of launch.',
          'Reduced app load time from 4.2 seconds to 1.1 seconds.',
          'Boosted App Store rating from 3.2 to 4.7 stars.',
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
        businessProblem:
            'Users needed a localized, high-performance portal to discover events, news, and directories in Qatar, but previous solutions suffered from poor localization support and slow content feeds.',
        challenges: [
          'Implementing seamless, dynamic RTL (Right-to-Left) and LTR (Left-to-Right) language switching without app reloads.',
          'Managing complex, heavily nested JSON structures from a legacy CMS backend.',
          'Ensuring reliable push notification delivery across a fragmented Android device ecosystem.',
        ],
        stateManagement:
            'Provider-based state management for lightweight, scoped dependency injection and reactive UI updates.',
        backend:
            'Legacy PHP-based REST API, wrapped in a robust Dart repository layer for data normalization.',
        database:
            'SQLite (via sqflite) for extensive offline caching of directory data and user bookmarks.',
        authentication:
            'Custom JWT-based authentication with seamless token refresh logic interceptors.',
        performanceOptimizations: [
          'Implemented a robust local caching strategy, reducing redundant network calls by 70%.',
          'Optimized JSON parsing using compute() isolates to prevent UI thread jank during initial load.',
          'Lazy-loading and pagination implemented across all major feed views.',
        ],
        security:
            'Certificate pinning to prevent Man-in-the-Middle (MITM) attacks on public Wi-Fi networks.',
        testingStrategy:
            'Focus on unit testing the complex data parsing and normalization layer to ensure resilience against unexpected nulls from the legacy API.',
        scalability:
            'Client-side resilience built to gracefully degrade UI when the legacy backend experiences high load.',
        lessonsLearned: [
          'Building a robust anti-corruption layer (repository pattern) is critical when integrating with legacy systems.',
          'RTL layout support requires meticulous attention to custom padding, alignment, and icon mirroring.',
        ],
        businessImpact: [
          'Achieved over 100,000+ active installs in the region.',
          'Increased daily active user (DAU) engagement time by 22% due to offline availability.',
          'Significantly reduced server load through aggressive client-side caching.',
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
        businessProblem:
            'Hotel staff required a centralized, real-time communication and task management system to respond to guest requests instantly, replacing fragmented radio and paper-based workflows.',
        challenges: [
          'Ensuring 100% reliable real-time task notifications even when the app is in the background or killed.',
          'Building an intuitive, high-contrast UI for staff working in fast-paced, sometimes low-light environments.',
          'Managing complex state transitions for tasks (Pending -> Assigned -> In Progress -> Completed).',
        ],
        stateManagement:
            'Hybrid approach using MVVM for screen-level logic and BLoC for global, application-wide event streams (e.g., incoming tasks, socket connection status).',
        backend:
            'Firebase Cloud Functions serving as serverless endpoints for complex business logic, alongside direct Firestore listeners.',
        database:
            'Cloud Firestore utilized for real-time document synchronization and offline persistence.',
        authentication:
            'Firebase Authentication integrated with custom claims for strict role-based access control (e.g., Manager, Housekeeping, Maintenance).',
        performanceOptimizations: [
          'Aggressive query optimization in Firestore to limit read operations and reduce billing costs.',
          'Custom background isolate implementation for processing incoming high-priority FCM (Firebase Cloud Messaging) payloads.',
          'Optimized asset loading for low-end Android devices typically used by hotel staff.',
        ],
        security:
            'Strict Firestore Security Rules enforcing data access at the document and field level based on custom auth claims.',
        testingStrategy:
            'Extensive unit testing of ViewModel logic. Integration testing for the Firebase rules locally using the Firebase Local Emulator Suite.',
        scalability:
            'Firestore\'s inherent scalability allowed the system to handle thousands of concurrent read/write operations during peak hotel check-in/check-out times.',
        lessonsLearned: [
          'Relying solely on FCM for critical real-time alerts requires a robust fallback mechanism (e.g., periodic background polling or active socket connections).',
          'The Firebase Local Emulator Suite is indispensable for safely testing complex security rules.',
        ],
        businessImpact: [
          'Reduced average guest request fulfillment time by 40%.',
          'Adopted by 50+ luxury hotels within the first year of deployment.',
          'Drastically reduced operational miscommunications and improved staff accountability.',
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
        businessProblem:
            'Needed a scalable, highly reliable mobile commerce platform capable of supporting a rapidly growing catalog and dynamic promotional campaigns without requiring frequent app updates.',
        challenges: [
          'Building a flexible UI architecture driven entirely by server-side configurations (Server-Driven UI).',
          'Implementing a robust cart and checkout flow resilient to network interruptions.',
          'Managing frequent release cycles across different environments (Staging, UAT, Production).',
        ],
        stateManagement:
            'Riverpod for robust, compile-safe dependency injection and reactive state management across the shopping cart and checkout flows.',
        backend:
            'Microservices architecture exposed via an API Gateway, handling inventory, pricing, and user profiles.',
        database:
            'Local Hive database for blazing-fast access to user preferences, search history, and cart state.',
        authentication:
            'Standard JWT implementation with biometric login fallback (FaceID/TouchID) for improved user experience.',
        performanceOptimizations: [
          'Implemented Server-Driven UI (SDUI) components to allow marketing teams to change home screen layouts without app updates.',
          'Pre-fetching and caching of category metadata during app startup.',
          'Optimized list rendering using custom Sliver layouts for complex promotional banners and product grids.',
        ],
        security:
            'Biometric authentication for quick login. Secure Enclave / Keystore used for storing sensitive session tokens.',
        testingStrategy:
            'Comprehensive widget testing for all SDUI components to ensure they render correctly based on diverse JSON payloads. Automated CI/CD pipeline using Fastlane.',
        scalability:
            'The SDUI architecture allowed the application to infinitely scale its feature set and layout complexity without bloating the client-side binary.',
        lessonsLearned: [
          'Server-Driven UI requires incredibly strict JSON contracts and robust fallback UI states for parsing failures.',
          'Automating the release process with Fastlane early on saves hundreds of hours of manual deployment effort.',
        ],
        businessImpact: [
          'Increased conversion rate by 15% through a streamlined, biometric-enabled checkout process.',
          'Reduced time-to-market for marketing campaigns from weeks to hours via SDUI.',
          'Maintained a 99.8% crash-free rate across 20+ automated releases.',
        ],
      ),
      Project(
        name: 'Toxic Truth: Know Your Rights',
        role: 'Team Lead',
        summary:
            'AI-powered privacy protection utility for workplace interaction logs with real-time transcription and analysis.',
        techStack: ['Flutter', 'Firebase', 'Assembly AI', 'MVVM', 'BLoC'],
        links: [],
        businessProblem:
            'Employees needed a secure, covert, and legally compliant way to document workplace harassment, utilizing AI to transcribe and analyze interactions for actionable insights.',
        challenges: [
          'Integrating complex third-party AI transcription services (Assembly AI) with real-time audio streams from the device.',
          'Ensuring absolute data privacy and security, given the highly sensitive nature of the recorded content.',
          'Designing a discreet UI that allows for quick, unobtrusive activation.',
        ],
        stateManagement:
            'BLoC pattern for orchestrating complex audio recording states, AI processing statuses, and secure data sync operations.',
        backend:
            'Firebase Cloud Functions utilized as a secure middleware layer to communicate with Assembly AI, preventing API key exposure on the client.',
        database:
            'Cloud Firestore for metadata, combined with Firebase Cloud Storage for secure, encrypted audio file retention.',
        authentication:
            'Anonymous authentication transitioning to linked email accounts, ensuring immediate usability without compromising security.',
        performanceOptimizations: [
          'Implemented chunked audio streaming to the backend to reduce memory overhead on the device during long recording sessions.',
          'Optimized background execution to ensure recording continues flawlessly even when the device is locked.',
          'Used native platform channels (MethodChannels) for precise control over audio hardware and background services.',
        ],
        security:
            'AES-256 encryption for audio files stored locally before cloud sync. App-level passcode and biometric lock to prevent unauthorized access.',
        testingStrategy:
            'Extensive manual testing of edge cases (incoming calls, Bluetooth audio switching, battery saver modes) during active recording. Unit testing of encryption and decryption utilities.',
        scalability:
            'Serverless architecture ensures the app can handle sudden spikes in usage without infrastructure provisioning overhead.',
        lessonsLearned: [
          'Managing background audio recording on modern Android/iOS devices requires deep native platform knowledge and constant handling of lifecycle interruptions.',
          'Privacy-first applications require rigorous architectural decisions to ensure data cannot be intercepted or accessed locally by other apps.',
        ],
        businessImpact: [
          'Successfully provided a critical utility for workplace rights documentation.',
          'Praised for its highly secure architecture and seamless AI transcription capabilities.',
          'Achieved high user retention due to the reliability of the background recording engine.',
        ],
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
