class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? iosLink;
  final String? androidLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}

//############ Hobby Projects ##############
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/01.png',
    title: 'College Management App',
    subtitle: 'This is a Role based app for Teacher, Admin and Student here ou can do all the operation which is doing in college/ schools.',
    androidLink: '',
    iosLink: '',
    webLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/01.png',
    title: 'College Management App',
    subtitle: 'This is a Role based app for Teacher, Admin and Student here ou can do all the operation which is doing in college/ schools.',
    androidLink: '',
    iosLink: '',
    webLink: '',
  ),ProjectUtils(
    image: 'assets/projects/01.png',
    title: 'College Management App',
    subtitle: 'This is a Role based app for Teacher, Admin and Student here ou can do all the operation which is doing in college/ schools.',
    androidLink: '',
    iosLink: '',
    webLink: '',
  ),
];

//############ Work Projects ##############
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image:  'assets/projects/01.png',
    title: 'College Management App',
    subtitle: 'This is a Role based app for Teacher, Admin and Student here ou can do all the operation which is doing in college/ schools.',
    androidLink: '',
    iosLink: '',
    webLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/02.png',
    title: 'Hastkala - Ecommerce Platform',
    subtitle: '“Hastkala – E-commerce”, a Flutter-based platform for handmade products. It features a clean UI with product listings, categories, and a smooth checkout experience. Designed with warm earthy tones, it reflects the essence of promoting artisans and authentic handcrafted goods through a modern digital shopping experience.',
    androidLink: '',
    iosLink: '',
    webLink: '',
  ),
  ProjectUtils(
    image: 'assets/projects/03.png',
    title: 'My Chat – Chatting Application',
    subtitle: 'A real-time chat app built with Flutter and Firebase, enabling secure authentication and instant messaging. It features a simple, modern UI with smooth conversation flow, real-time updates, and reliable performance for seamless one-to-one communication.',
    androidLink: '',
    iosLink: '',
    webLink: '',
  ),
  
];
