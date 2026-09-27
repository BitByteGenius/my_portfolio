class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final List<String> techStack;
  final String? iosLink;
  final String? androidLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.techStack = const [],
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}

// Work Projects
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/01.png',
    title: 'College Management App',
    subtitle:
        'A comprehensive role-based portal for Students, Teachers, and Administrators. Enables grade management, attendance tracking, notice boards, and fee processing with smooth real-time sync.',
    techStack: ['Flutter', 'Dart', 'REST API', 'GetX'],
    androidLink: 'https://github.com/BitByteGenius/School_Management_App',
    githubLink: 'https://github.com/BitByteGenius',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'Hastkala - E-Commerce Platform',
    subtitle:
        'A artisan e-commerce application featuring warm aesthetic design, product categorizations, shopping cart management, payment gateway integration, and seamless order tracking.',
    techStack: ['Flutter', 'Firebase', 'State Management', 'UI/UX'],
    androidLink: 'https://github.com/BitByteGenius/Cartify',
    githubLink: 'https://github.com/BitByteGenius',
  ),
  ProjectUtils(
    image: 'assets/projects/Jeevan Care.png',
    title: 'Jeevan Care - Healthcare Platform',
    subtitle:
        'JeevanCare is a modern healthcare platform designed for medicine discovery, healthcare products, lab tests, and doctor consultations. I developed the application using Flutter and Dart, with GetX for state management and responsive UI architecture. JavaScript and Node.js were used for backend development and API integration. The app includes structured modules, reusable components, location and map-based functionality, search, banners, healthcare categories, and product workflows. The architecture is designed to be scalable, maintainable, and ready for seamless future backend and service integrations.',
    techStack: ['Flutter', 'Node.js', 'Google Maps', 'GetX', 'REST APIs', 'Responsive UI', 'State Management', 'Reusable Components', 'JavaScript', 'Dart'],
    androidLink: 'https://github.com/BitByteGenius/jeevancare-frontend',
    githubLink: 'https://github.com/BitByteGenius',
  ),
  ProjectUtils(
    image: 'assets/projects/oji_one.jpeg',
    title: 'Oji One - Smart Service Hub',
    subtitle:
        'Oji One is a location-based platform designed to bring everyday needs into one place. Users can discover rooms, flats, PGs, hostels, hotels, and homestays, access local services like electricians and plumbers, shop local and GI-tagged products, rent cars or bikes, and explore tours and experiences. The platform aims to make discovering trusted local options easier for students, professionals, travellers, families, and residents while helping local businesses gain visibility and reach new customers.',
    techStack: ['Flutter', 'REST APIs', 'Google Maps', 'Node.js', 'JavaScript', 'Dart', 'GetX', 'State Management', 'Responsive UI'],
    androidLink: 'https://github.com/BitByteGenius/sewasetuu-app',
    githubLink: 'https://github.com/BitByteGenius',
  ),
];

// Hobby / Featured Projects
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'AI Portfolio & Automation Suite',
    subtitle:
        'An interactive personal workspace showcasing AI integration, dynamic layout engines, and cross-platform Flutter web performance.',
    techStack: ['Flutter Web', 'Dart', 'GetX'],
    githubLink: 'https://github.com/BitByteGenius',
    webLink: 'https://github.com/BitByteGenius',
  ),
];
