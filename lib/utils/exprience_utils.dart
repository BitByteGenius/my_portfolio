class ExperienceUtils {
  final String logo;
  final String role;
  final String title;
  final String subtitle;
  final String? checkletter;
  final List<String> highlights;

  ExperienceUtils({
    required this.logo,
    required this.role,
    required this.title,
    required this.subtitle,
    this.checkletter,
    this.highlights = const [],
  });
}

// Alias for backward compatibility
typedef ExprienceUtils = ExperienceUtils;

final List<ExperienceUtils> experienceList = [
  ExperienceUtils(
    logo: 'assets/exprience/trip8.png',
    title: 'Trip8. • June 2026 - August 2026',
    role: 'Full Stack Developer',
    subtitle:
        'Architected and delivered end-to-end full stack web & mobile applications. Focused on seamless client-server interaction, API optimization, state management with GetX/Bloc, and UI responsiveness across devices.',
    highlights: [
      'Engineered cross-platform mobile and web interfaces with clean architecture.',
      'Designed and consumed RESTful APIs with secure authentication flow.',
      'Optimized app render performance and reduced load times by 35%.',
    ],
    checkletter: '',
  ),
  ExperienceUtils(
    logo: 'assets/exprience/greynext_logo.png',
    title: 'GreyNext Technologies Pvt. Ltd. • March 2026 - May 2026',
    role: 'Software Developer Intern',
    subtitle:
        'Developed and maintained enterprise-grade applications, implemented responsive UI, integrated RESTful APIs, optimized performance, fixed production issues, and collaborated with cross-functional teams using Git.',
    highlights: [
      'Built reusable UI component libraries for standard web and mobile layouts.',
      'Integrated complex third-party SDKs and state management workflows.',
      'Conducted unit testing and bug fixing in agile sprint cycles.',
    ],
    checkletter: '',
  ),
  ExperienceUtils(
    logo: 'assets/exprience/veecap.png',
    title: 'Veecap Eduventures Pvt. Ltd. • Mar 2025 - Mar 2026',
    role: 'Computer Research • IIT Guwahati',
    subtitle:
        'Gained hands-on experience with software tools and digital platforms in a research environment at IIT Guwahati. Trained 800+ students under IIT Bombay initiatives.',
    highlights: [
      'Spearheaded research workflows and digital learning platform management.',
      'Trained and mentored 800+ students under prestigious IIT Bombay initiatives.',
      'Strengthened technical reporting, team leadership, and developer collaboration.',
    ],
    checkletter: '',
  ),
];

// ignore: non_constant_identifier_names
List<ExperienceUtils> get ExprienceSectionUtils => experienceList;